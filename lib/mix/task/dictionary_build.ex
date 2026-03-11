defmodule Mix.Tasks.MctNuke.Dictionary.Build do
  @moduledoc "Build Nucleares API dictionary.  Requires a running webserver."
  @shortdoc "Build API dictionary"

  use Mix.Task
  alias MctNuke.Dictionary.Metric

  def run([]) do
    {:ok, _} = Application.ensure_all_started([:req])

    api_values =
      MctNuke.API.get_json("WEBSERVER_BATCH_GET")
      |> Map.fetch!("values")

    metrics =
      MctNuke.API.get_json("WEBSERVER_LIST_VARIABLES_JSON")
      |> Map.fetch!("GET")
      |> Enum.flat_map(fn key ->
        case Map.fetch(api_values, key) do
          {:ok, value} -> [build_metric(key, value, api_values)]
          :error -> []
        end
      end)

    version = api_values |> Map.fetch!("GAME_VERSION")

    metrics_code =
      metrics
      |> inspect(pretty: true, width: 500, limit: :infinity)
      |> String.replace("MctNuke.Dictionary.Metric", "Metric")
      |> String.replace("\n", "\n  ")

    File.write!("lib/mct_nuke/dictionary/data.ex", """
    # Auto-generated on #{DateTime.utc_now()} from Nucleares version #{version}.
    # DO NOT EDIT.  Changes will be overwritten on next generation.

    defmodule MctNuke.Dictionary.Data do
      alias MctNuke.Dictionary.Metric

      @metrics #{metrics_code}

      def metrics, do: @metrics
    end
    """)
  end

  defp build_metric(key, value, all_values) do
    name = guess_name(key, value)

    {format, units} =
      case guess_type(key, value, all_values) do
        {f, u} -> {f, u}
        f -> {f, nil}
      end

    %Metric{
      name: name,
      key: key,
      format: format,
      units: units
    }
  end

  defp guess_name(key, _) do
    key
    |> String.split("_")
    |> Enum.map(&String.capitalize/1)
    |> Enum.map(&replace_word/1)
    |> Enum.reject(&is_nil/1)
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
      key =~ ~r{_COUNTER$} -> {:int, "x"}
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
      key =~ ~r{^COOLANT_(CORE|SEC)_CIRCULATION_PUMP_[0-9]_CAPACITY$} -> {:float, "L/m"}
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
end
