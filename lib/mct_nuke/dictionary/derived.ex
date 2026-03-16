defmodule MctNuke.Dictionary.Derived do
  alias MctNuke.Dictionary.Metric
  alias MctNuke.Dictionary.Folder

  @enforce_keys [:folder, :name, :key, :source_keys, :fun_name, :format]
  defstruct(
    folder: nil,
    name: nil,
    key: nil,
    source_keys: nil,
    fun_name: nil,
    format: nil,
    units: nil,
    min: nil,
    max: nil
  )

  alias __MODULE__

  defmodule Data do
    def generate do
      [
        %Derived{
          folder: "power",
          name: "Power Generation vs Demand",
          key: "POWER_GENERATION_VS_DEMAND",
          source_keys: [
            "GENERATOR_0_KW",
            "GENERATOR_1_KW",
            "GENERATOR_2_KW",
            "POWER_FROM_TURBINE_KW",
            "POWER_DEMAND_MW"
          ],
          fun_name: :power_supply_versus_demand,
          format: :float,
          units: "%",
          min: 0
        },
        %Derived{
          folder: "power",
          name: "Power Supply vs Demand",
          key: "POWER_SUPPLY_VS_DEMAND",
          source_keys: [
            "GENERATOR_0_KW",
            "GENERATOR_1_KW",
            "GENERATOR_2_KW",
            "POWER_FROM_TURBINE_KW",
            "POWER_DEMAND_MW",
            "RES_EFFECTIVELY_DERIVED_ENERGY_MW"
          ],
          fun_name: :power_supply_versus_demand,
          format: :float,
          units: "%",
          min: 0
        },
        %Derived{
          folder: "power.resistor_banks",
          name: "Resistor Bank Usage",
          key: "RESISTOR_BANK_USAGE",
          source_keys: [
            "RES_EFFECTIVELY_DERIVED_ENERGY_MW",
            "RES_ABSORPTION_CAPACITY_MW"
          ],
          fun_name: :resistor_bank_usage,
          format: :float,
          units: "%",
          min: 0,
          max: 100
        }
      ]
    end
  end

  @derived Data.generate()
  @by_folder @derived |> Enum.group_by(fn d -> d.folder end)
  @by_key @derived |> Map.new(fn d -> {d.key, d} end)

  defmodule Functions do
    def power_supply_versus_demand(data) do
      generated =
        0..2
        |> Enum.map(&Map.fetch!(data, "GENERATOR_#{&1}_KW"))
        |> Enum.sum()
        |> Kernel./(1000)

      demand = Map.fetch!(data, "POWER_DEMAND_MW")
      used = Map.fetch!(data, "POWER_FROM_TURBINE_KW") / 1000
      absorbed = Map.get(data, "RES_EFFECTIVELY_DERIVED_ENERGY_MW", 0)

      if demand > 0 do
        (generated - used - absorbed) / demand * 100
      else
        nil
      end
    end

    def resistor_bank_usage(data) do
      cur = Map.fetch!(data, "RES_EFFECTIVELY_DERIVED_ENERGY_MW")
      max = Map.fetch!(data, "RES_ABSORPTION_CAPACITY_MW")

      if max > 0 do
        cur / max * 100
      else
        nil
      end
    end
  end

  def for_folder(%Folder{key: folder_key}) do
    @by_folder
    |> Map.get(folder_key, [])
    |> Enum.map(&virtual_metric/1)
  end

  defp virtual_metric(%Derived{} = derived) do
    %Metric{
      api_index: -1,
      name: derived.name,
      key: derived.key,
      format: derived.format,
      units: derived.units,
      min: derived.min,
      max: derived.max
    }
  end

  def for_history(key) do
    case Map.fetch(@by_key, key) do
      {:ok, d} -> {d.source_keys, Function.capture(Functions, d.fun_name, 1)}
      :error -> nil
    end
  end

  def add_telemetry(telemetry) do
    telemetry
    |> Map.update!(:value, fn data ->
      @derived
      |> Enum.reduce(data, &add_derived/2)
    end)
  end

  defp add_derived(%Derived{} = derived, data) do
    specific_data = Map.take(data, derived.source_keys)

    data
    |> Map.put(derived.key, apply(Functions, derived.fun_name, [specific_data]))
  end
end
