defmodule MctNuke.Dictionary.Names do
  @vessels %{
    "BORIC ACID" => "Boric Acid Tank",
    "CHEMICAL WASTE CONTAINER" => "Chemical Waste Tank",
    "CONDENSER" => "Condenser",
    "CORE POOL STORAGE TANK" => "Core Pool Storage Tank",
    "CORE POOL" => "Core Pool",
    "Condenser Retention Tank" => "Condenser Retention Tank",
    "DIESEL FUEL" => "Diesel Fuel Tank",
    "EXTERNAL RESERVOIR" => "External Coolant Reservoir",
    "OCEANO" => "Ocean",
    "PRESSURIZER" => "Pressurizer",
    "PRIMARY CIRCUIT STORAGE TANK" => "Primary Circuit Storage Tank",
    "RINSE TANK" => "Rinse Tank",
    "SODIUM HYDROXIDE" => "Sodium Hydroxide Tank",
    "SteamGenerators_1" => "Steam Generator 01",
    "SteamGenerators_2" => "Steam Generator 02",
    "SteamGenerators_3" => "Steam Generator 03",
    # No idea what this is.  (It's not the chemical waste container, that's above.)
    "WASTE TANK" => "Waste Tank"
  }

  @pumps %{
    "BC_0_CONDENSADOR_CIRCULACION" => "Condenser Cooling Pump",
    "BC_0_EXTERIOR_CARGA" => "External Freight Pump",
    "BC_0_GENERADOR_CIRCULACION" => "Secondary Pump 01",
    "BC_0_QUIMICA_CIRCULACION_QUIMICA" => "Ion Exchange Pump",
    "BC_0_QUIMICA_DOSIFICADORA" => "Boron Dosing Pump",
    "BC_0_REFRIGERANTE_CARGA" => "Primary Circuit Pump",
    "BC_0_REFRIGERANTE_CIRCULACION" => "Circulation Pump 01",
    "BC_1_CONDENSADOR_CARGA" => "Secondary Circuit Freight Pump",
    "BC_1_EXTERIOR_CARGA" => "Internal Freight Pump",
    "BC_1_GENERADOR_CIRCULACION" => "Secondary Pump 02",
    "BC_1_QUIMICA_CIRCULACION_QUIMICA" => "Chemical Cleaning Pump",
    "BC_1_REFRIGERANTE_CIRCULACION" => "Circulation Pump 02",
    "BC_2_EXTERIOR_CARGA" => "Transfer Freight Pump",
    "BC_2_GENERADOR_CIRCULACION" => "Secondary Pump 03",
    "BC_2_NUCLEO_CARGA" => "Core Pool Pump",
    "BC_2_REFRIGERANTE_CIRCULACION" => "Circulation Pump 03"
  }

  def vessel(key), do: Map.fetch!(@vessels, key)
  def pump(key), do: Map.fetch!(@pumps, key)
end
