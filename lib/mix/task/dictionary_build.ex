defmodule Mix.Tasks.MctNuke.Dictionary.Build do
  @moduledoc "Build Nucleares API dictionary.  Requires a running webserver."
  @shortdoc "Build API dictionary"

  use Mix.Task
  alias MctNuke.Dictionary.Metric
  alias MctNuke.Dictionary.Folder

  def run([]) do
    {:ok, _} = Application.ensure_all_started([:req])

    api_values =
      MctNuke.API.get_json("WEBSERVER_BATCH_GET")
      |> Map.fetch!("values")

    metrics =
      MctNuke.API.get_json("WEBSERVER_LIST_VARIABLES_JSON")
      |> Map.fetch!("GET")
      |> Enum.with_index()
      |> Enum.flat_map(fn {key, index} ->
        case Map.fetch(api_values, key) do
          {:ok, value} -> [build_metric(index, key, value, api_values)]
          :error -> []
        end
      end)
      |> renumber_groups()
      |> nest_in_folders()

    version = api_values |> Map.fetch!("GAME_VERSION")

    data =
      metrics
      |> inspect(pretty: true, width: 90, limit: :infinity)
      |> String.replace("%MctNuke.Dictionary.", "%")
      |> String.replace("\n", "\n  ")

    File.write!("lib/mct_nuke/dictionary/data.ex", """
    # Auto-generated on #{DateTime.utc_now()} from Nucleares version #{version}.
    # DO NOT EDIT.  Changes will be overwritten on next generation.

    defmodule MctNuke.Dictionary.Data do
      alias MctNuke.Dictionary.{Metric, Folder}

      @root #{data}

      def root, do: @root
    end
    """)
  end

  defp build_metric(index, key, value, all_values) do
    name = guess_name(key, value)

    {format, units} =
      case guess_type(key, value, all_values) do
        {f, u} -> {f, u}
        f -> {f, nil}
      end

    {min, max} = guess_min_max(format, units)

    %Metric{
      api_index: index,
      name: name,
      key: key,
      format: format,
      units: units,
      min: min,
      max: max
    }
  end

  defp guess_name(key, _) do
    key
    |> String.split("_")
    |> Enum.map(&String.capitalize/1)
    |> Enum.map(&replace_word/1)
    |> Enum.reject(&is_nil/1)
    # Remove duplicate words, e.g. "Power From External Power"
    |> Enum.uniq()
    |> Enum.join(" ")
  end

  defp replace_word("Temp"), do: "Temperature"
  defp replace_word("Min"), do: "Minimum"
  defp replace_word("Max"), do: "Maximum"
  defp replace_word("Avg"), do: "Average"
  defp replace_word("Rods"), do: "Control Rods"
  defp replace_word("Rod"), do: "Control Rod"
  defp replace_word("Res"), do: "Resistor Bank"
  defp replace_word("Sec"), do: "Secondary"
  defp replace_word("Gen"), do: "Generator"
  defp replace_word("Chem"), do: "Chemical"
  defp replace_word("Mscv"), do: "MSCV"
  # All cases of Mw can just be deleted:
  defp replace_word("Mw"), do: nil
  defp replace_word("Kw"), do: "Power"
  defp replace_word("V"), do: "Voltage"
  defp replace_word("A"), do: "Amperage"
  defp replace_word("Rpm"), do: "RPM"
  defp replace_word(word), do: word

  defp guess_type(_, true, _), do: :boolean
  defp guess_type(_, false, _), do: :boolean
  defp guess_type(_, value, _) when is_binary(value), do: :string
  defp guess_type(key, nil, all), do: guess_nil(key, all)
  defp guess_type(key, value, _) when is_integer(value), do: guess_integer(key, value)
  defp guess_type(key, value, _) when is_float(value), do: guess_float(key, value)

  @degrees_celsius "\u2103"

  defp guess_integer("GAME_DIFFICULTY", _), do: :integer
  defp guess_integer("TIME_" <> _, _), do: :integer
  defp guess_integer("CORE_POOL_PUMP", _), do: :integer
  defp guess_integer("RODS_QUANTITY", _), do: {:integer, "rods"}

  defp guess_integer(key, value) do
    cond do
      key =~ ~r{_STAT(E|US)$} -> :integer
      key =~ ~r{_MODE$} -> :integer
      key =~ ~r{_COUNTER$} -> {:integer, "x"}
      key =~ ~r{_TEMP(ERATURE)?($|_)} -> {:float, @degrees_celsius}
      key =~ ~r{_QUANTITY_.*_PUMPS_PRESENT$} -> {:integer, "pumps"}
      key =~ ~r{_GENERATOR_[0-9]_FUEL$} -> {:integer, "L"}
      true -> raise "Unknown units for integer #{inspect(key)} (value: #{inspect(value)})"
    end
  end

  defp guess_float("STEAM_EJECTOR_MOTIVE", _), do: {:float, "%"}
  defp guess_float("COOLANT_CORE_PRIMARY_LOOP_LEVEL", _), do: {:float, "%"}
  defp guess_float("COOLANT_CORE_FLOW_" <> _, _), do: {:float, "L/min"}
  defp guess_float("RODS_POS_ACTUAL" <> _, _), do: {:float, "%"}
  defp guess_float("CORE_EXTERNAL_COOLANT_RESERVOIR_VOLUME" <> _, _), do: {:float, "kL"}

  defp guess_float(key, value) do
    cond do
      # Percentage valve openings:
      key =~ ~r{^MSCV_[0-9]_OPENING_ACTUAL$} -> {:float, "%"}
      key =~ ~r{^STEAM_TURBINE_[0-9]_BYPASS_ACTUAL$} -> {:float, "%"}
      key =~ ~r{^VALVE_[A-Z0-9]+_OPEN$} -> {:float, "%"}
      key =~ ~r{_VALVE_(ORDERED|ACTUAL)$} -> {:float, "%"}
      key =~ ~r{_VALVE_OPENING$} -> {:float, "%"}
      # Percentage pump speeds:
      key =~ ~r{^CHEM_BORON_FILTER_(ORDERED|ACTUAL)$} -> {:float, "%"}
      key =~ ~r{_(ORDERED_)?SPEED$} -> {:float, "%"}
      key =~ ~r{_PUMP_POWER$} -> {:float, "%"}
      # Percentage control rods inserted:
      key =~ ~r{^ROD_BANK_POS_[0-9]_(ORDERED|ACTUAL)$} -> {:float, "%"}
      # Other percentages:
      key =~ ~r{_(INTEGRITY|WEAR)$} -> {:float, "%"}
      key =~ ~r{_FISSIONABLE$} -> {:float, "%"}
      key =~ ~r{_TORQUE$} -> {:float, "%"}
      key =~ ~r{_VACUUM$} -> {:float, "%"}
      # Volumes:
      key =~ ~r{^CONDENSER_(VAPOR_)?VOLUME$} -> {:float, "hL"}
      key =~ ~r{^COOLANT_SEC_[0-9]_(LIQUID_)?VOLUME$} -> {:float, "hL"}
      key =~ ~r{_QUANTITY_IN_VESSEL$} -> {:float, "kL"}
      key =~ ~r{_TANK_VOLUME$} -> {:float, "L"}
      # Flow rates:
      key =~ ~r{^CHEM_BORON_DOSAGE_(ORDERED|ACTUAL)$} -> {:float, "g/min"}
      key =~ ~r{^COOLANT_(CORE|SEC)_CIRCULATION_PUMP_[0-9]_CAPACITY$} -> {:float, "L/min"}
      key =~ ~r{^STEAM_GEN_[0-9]_BOILING_POINT$} -> {:float, @degrees_celsius}
      #   All of these seem to match the mass flow rate, which is in kg/min:
      key =~ ~r{^CONDENSER_(CONDENSATE|EXTRACTION)_FLOW_RATE$} -> {:float, "kg/min"}
      key =~ ~r{^CONDENSER_COOLANT_EVAPORATED$} -> {:float, "kg/min"}
      key =~ ~r{^STEAM_GEN_[0-9]_(INLET|OUTLET|EVAPORATED)$} -> {:float, "kg/min"}
      key =~ ~r{^STEAM_GEN_[0-9]_RETURN_FLOW_PLUS_CONDENSED$} -> {:float, "kg/min"}
      # Factors (unitless):
      key =~ ~r{_CRITICALITY$} -> :float
      key =~ ~r{_FACTOR(_CHANGE)?$} -> :float
      key =~ ~r{^CORE_(IODINE|XENON)_(GENERATION|CUMULATIVE)$} -> :float
      # Electrical:
      key =~ ~r{_V$} -> {:float, "V"}
      key =~ ~r{_A$} -> {:float, "A"}
      key =~ ~r{_KW$} -> {:float, "kW"}
      key =~ ~r{_MW$} -> {:float, "MW"}
      key =~ ~r{_HERTZ$} -> {:float, "Hz"}
      # Plain units:
      key =~ ~r{_PPM$} -> {:float, "ppm"}
      key =~ ~r{_PRESSURE($|_)} -> {:float, "bar"}
      key =~ ~r{_RPM$} -> {:float, "RPM"}
      key =~ ~r{_TEMP(ERATURE)?($|_)} -> {:float, @degrees_celsius}
      true -> raise "Unknown units for float #{inspect(key)} (value: #{inspect(value)})"
    end
  end

  defp guess_nil("FUN_IS_ENABLED", _), do: :boolean

  defp guess_nil(key, all_values) do
    case similar_value(key, all_values) do
      {k, v} -> guess_type(k, v, all_values)
      nil -> raise "Unknown type for nil value: #{inspect(key)}"
    end
  end

  defp similar_value(key, all) do
    zeroed = zero_digits(key)

    all
    |> Enum.find(fn {k, v} ->
      zero_digits(k) == zeroed && !is_nil(v)
    end)
  end

  defp zero_digits(key) do
    String.replace(key, ~r{[1-9]}, "0")
  end

  defp guess_min_max(_, nil), do: {nil, nil}
  defp guess_min_max(:float, "%"), do: {0, 100}
  # No negative pressures:
  defp guess_min_max(:float, "bar"), do: {0, nil}
  # No negative volumes:
  defp guess_min_max(:float, "L"), do: {0, nil}
  defp guess_min_max(:integer, "L"), do: {0, nil}
  defp guess_min_max(:float, "kL"), do: {0, nil}
  defp guess_min_max(:float, "hL"), do: {0, nil}
  # No negative flows:
  defp guess_min_max(:float, "L/min"), do: {0, nil}
  defp guess_min_max(:float, "g/min"), do: {0, nil}
  defp guess_min_max(:float, "kg/min"), do: {0, nil}
  # No negative concentrations:
  defp guess_min_max(:float, "ppm"), do: {0, nil}
  # No negative counters / inventories:
  defp guess_min_max(:integer, "x"), do: {0, nil}
  defp guess_min_max(:integer, "pumps"), do: {0, nil}
  defp guess_min_max(:integer, "rods"), do: {0, nil}
  # No negative electricity:
  defp guess_min_max(:float, "kW"), do: {0, nil}
  defp guess_min_max(:float, "MW"), do: {0, nil}
  defp guess_min_max(:float, "V"), do: {0, nil}
  defp guess_min_max(:float, "A"), do: {0, nil}
  defp guess_min_max(:float, "Hz"), do: {0, nil}
  defp guess_min_max(:float, "RPM"), do: {0, nil}
  # We don't typically deal with frozen stuff:
  defp guess_min_max(:float, @degrees_celsius), do: {0, nil}

  defp renumber_groups(metrics) do
    metrics
    |> Enum.group_by(fn %Metric{name: n} ->
      case String.split(n, ~r{[0-9]+}, parts: 2) do
        [before, _] -> before
        [_] -> nil
      end
    end)
    |> Enum.flat_map(&renumber_group/1)
  end

  defp renumber_group({nil, metrics}), do: metrics

  defp renumber_group({before, metrics}) do
    regex = ~r{^#{before}0+(\s|$)}

    has_zero =
      metrics
      |> Enum.any?(fn %Metric{name: n} -> n =~ regex end)

    if has_zero do
      metrics
      |> Enum.map(fn %Metric{} = m ->
        %Metric{m | name: increment_number(m.name)}
      end)
    else
      metrics
    end
  end

  defp increment_number(name) do
    name
    |> String.replace(~r{\d+}, fn number ->
      digits = String.length(number)

      number
      |> String.to_integer()
      |> Kernel.+(1)
      |> Integer.to_string()
      |> String.pad_leading(digits, "0")
    end)
  end

  defp nest_in_folders(metrics) do
    by_folder =
      metrics
      |> Enum.group_by(fn %Metric{key: key} -> guess_folder(key) end)

    Folder.generate_tree(:root, by_folder)
  end

  defp guess_folder("ALARMS_ACTIVE"), do: "misc"
  defp guess_folder("AMBIENT_TEMPERATURE"), do: "misc"
  defp guess_folder("FUN_IS_ENABLED"), do: "misc"
  defp guess_folder("GAME_" <> _), do: "misc"
  defp guess_folder("TIME" <> _), do: "misc"

  defp guess_folder(<<"CORE_BAY_", n::binary-size(1), "_", _::binary>>), do: "core.bay_#{n}"
  defp guess_folder(<<"CORE_FUEL_", n::binary-size(1), "_", _::binary>>), do: "core.bay_#{n}"

  defp guess_folder(<<"ROD_BANK_POS_", n::binary-size(1), "_", _::binary>>),
    do: "core.bay_#{incr(n)}"

  defp guess_folder("CORE_" <> _), do: "core"
  defp guess_folder("COOLANT_CORE_" <> _), do: "core.coolant"
  defp guess_folder("RODS_" <> _), do: "core.rods"

  defp guess_folder("CONDENSER_VACUUM" <> _), do: "condenser.vacuum"
  defp guess_folder("VACUUM_" <> _), do: "condenser.vacuum"
  defp guess_folder("STEAM_EJECTOR_" <> _), do: "condenser.vacuum"
  defp guess_folder("CONDENSER_" <> _), do: "condenser"

  defp guess_folder("POWER_" <> _), do: "power"
  defp guess_folder("RES_" <> _), do: "power.resistor_banks"
  defp guess_folder("RESISTOR_BANK_" <> _), do: "power.resistor_banks"
  defp guess_folder("RESISTOR_BANKS_" <> _), do: "power.resistor_banks"

  defp guess_folder("CHEM_" <> _), do: "chemicals"
  defp guess_folder("CHEMICAL_" <> _), do: "chemicals"

  defp guess_folder(<<"COOLANT_SEC_", n::binary-size(1), "_", _::binary>>),
    do: "secondary.loop_#{incr(n)}"

  defp guess_folder(<<"COOLANT_SEC_CIRCULATION_PUMP_", n::binary-size(1), "_", _::binary>>),
    do: "secondary.loop_#{incr(n)}"

  defp guess_folder(<<"GENERATOR_", n::binary-size(1), "_", _::binary>>),
    do: "secondary.loop_#{incr(n)}.generator"

  defp guess_folder(<<"MSCV_", n::binary-size(1), "_", _::binary>>),
    do: "secondary.loop_#{incr(n)}.steam"

  defp guess_folder(<<"STEAM_GEN_", n::binary-size(1), "_", _::binary>>),
    do: "secondary.loop_#{incr(n)}.steam"

  defp guess_folder(<<"STEAM_TURBINE_", n::binary-size(1), "_", _::binary>>),
    do: "secondary.loop_#{incr(n)}.turbine"

  defp guess_folder(<<"EMERGENCY_GENERATOR_", n::binary-size(1), "_", _::binary>>),
    do: "emergency_power.generator_#{n}"

  defp guess_folder("EMERGENCY_" <> _), do: "emergency_power"

  defp guess_folder("FREIGHT_" <> _), do: "freight_pumps"
  defp guess_folder("VALVE_" <> _), do: "valves"

  defp incr(num_str), do: String.to_integer(num_str) + 1
end
