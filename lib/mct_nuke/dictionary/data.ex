# Auto-generated on 2026-03-12 07:04:08.271695Z from Nucleares version V 2.2.25.213.
# DO NOT EDIT.  Changes will be overwritten on next generation.

defmodule MctNuke.Dictionary.Data do
  alias MctNuke.Dictionary.{Metric, Folder}

  @root %Folder{
    name: "Nucleares",
    key: :root,
    subfolders: [
      %Folder{
        name: "Misc",
        key: "misc",
        subfolders: [],
        metrics: [
          %Metric{
            api_index: 1,
            name: "Game Version",
            key: "GAME_VERSION",
            format: :string,
            units: nil
          },
          %Metric{
            api_index: 2,
            name: "Game Difficulty",
            key: "GAME_DIFFICULTY",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 3,
            name: "Time",
            key: "TIME",
            format: :string,
            units: nil
          },
          %Metric{
            api_index: 4,
            name: "Time Stamp",
            key: "TIME_STAMP",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 5,
            name: "Time Day",
            key: "TIME_DAY",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 6,
            name: "Alarms Active",
            key: "ALARMS_ACTIVE",
            format: :string,
            units: nil
          },
          %Metric{
            api_index: 317,
            name: "Game Sim Speed",
            key: "GAME_SIM_SPEED",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 319,
            name: "Fun Is Enabled",
            key: "FUN_IS_ENABLED",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 320,
            name: "Ambient Temperature",
            key: "AMBIENT_TEMPERATURE",
            format: :float,
            units: "℃"
          }
        ]
      },
      %Folder{
        name: "Core",
        key: "core",
        subfolders: [
          %Folder{
            name: "Bay 1",
            key: "core.bay_1",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 28,
                name: "Core Fuel 1 Temperature",
                key: "CORE_FUEL_1_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 29,
                name: "Core Fuel 1 Fissionable",
                key: "CORE_FUEL_1_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 30,
                name: "Core Fuel 1 Power Factor",
                key: "CORE_FUEL_1_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 31,
                name: "Core Bay 1 State",
                key: "CORE_BAY_1_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 32,
                name: "Core Bay 1 Hatch Open",
                key: "CORE_BAY_1_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 297,
                name: "Control Rod Bank Pos 1 Ordered",
                key: "ROD_BANK_POS_0_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 298,
                name: "Control Rod Bank Pos 1 Actual",
                key: "ROD_BANK_POS_0_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 2",
            key: "core.bay_2",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 33,
                name: "Core Fuel 2 Temperature",
                key: "CORE_FUEL_2_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 34,
                name: "Core Fuel 2 Fissionable",
                key: "CORE_FUEL_2_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 35,
                name: "Core Fuel 2 Power Factor",
                key: "CORE_FUEL_2_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 36,
                name: "Core Bay 2 State",
                key: "CORE_BAY_2_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 37,
                name: "Core Bay 2 Hatch Open",
                key: "CORE_BAY_2_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 299,
                name: "Control Rod Bank Pos 2 Ordered",
                key: "ROD_BANK_POS_1_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 300,
                name: "Control Rod Bank Pos 2 Actual",
                key: "ROD_BANK_POS_1_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 3",
            key: "core.bay_3",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 38,
                name: "Core Fuel 3 Temperature",
                key: "CORE_FUEL_3_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 39,
                name: "Core Fuel 3 Fissionable",
                key: "CORE_FUEL_3_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 40,
                name: "Core Fuel 3 Power Factor",
                key: "CORE_FUEL_3_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 41,
                name: "Core Bay 3 State",
                key: "CORE_BAY_3_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 42,
                name: "Core Bay 3 Hatch Open",
                key: "CORE_BAY_3_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 301,
                name: "Control Rod Bank Pos 3 Ordered",
                key: "ROD_BANK_POS_2_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 302,
                name: "Control Rod Bank Pos 3 Actual",
                key: "ROD_BANK_POS_2_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 4",
            key: "core.bay_4",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 43,
                name: "Core Fuel 4 Temperature",
                key: "CORE_FUEL_4_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 44,
                name: "Core Fuel 4 Fissionable",
                key: "CORE_FUEL_4_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 45,
                name: "Core Fuel 4 Power Factor",
                key: "CORE_FUEL_4_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 46,
                name: "Core Bay 4 State",
                key: "CORE_BAY_4_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 47,
                name: "Core Bay 4 Hatch Open",
                key: "CORE_BAY_4_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 303,
                name: "Control Rod Bank Pos 4 Ordered",
                key: "ROD_BANK_POS_3_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 304,
                name: "Control Rod Bank Pos 4 Actual",
                key: "ROD_BANK_POS_3_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 5",
            key: "core.bay_5",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 48,
                name: "Core Fuel 5 Temperature",
                key: "CORE_FUEL_5_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 49,
                name: "Core Fuel 5 Fissionable",
                key: "CORE_FUEL_5_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 50,
                name: "Core Fuel 5 Power Factor",
                key: "CORE_FUEL_5_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 51,
                name: "Core Bay 5 State",
                key: "CORE_BAY_5_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 52,
                name: "Core Bay 5 Hatch Open",
                key: "CORE_BAY_5_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 305,
                name: "Control Rod Bank Pos 5 Ordered",
                key: "ROD_BANK_POS_4_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 306,
                name: "Control Rod Bank Pos 5 Actual",
                key: "ROD_BANK_POS_4_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 6",
            key: "core.bay_6",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 53,
                name: "Core Fuel 6 Temperature",
                key: "CORE_FUEL_6_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 54,
                name: "Core Fuel 6 Fissionable",
                key: "CORE_FUEL_6_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 55,
                name: "Core Fuel 6 Power Factor",
                key: "CORE_FUEL_6_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 56,
                name: "Core Bay 6 State",
                key: "CORE_BAY_6_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 57,
                name: "Core Bay 6 Hatch Open",
                key: "CORE_BAY_6_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 307,
                name: "Control Rod Bank Pos 6 Ordered",
                key: "ROD_BANK_POS_5_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 308,
                name: "Control Rod Bank Pos 6 Actual",
                key: "ROD_BANK_POS_5_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 7",
            key: "core.bay_7",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 58,
                name: "Core Fuel 7 Temperature",
                key: "CORE_FUEL_7_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 59,
                name: "Core Fuel 7 Fissionable",
                key: "CORE_FUEL_7_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 60,
                name: "Core Fuel 7 Power Factor",
                key: "CORE_FUEL_7_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 61,
                name: "Core Bay 7 State",
                key: "CORE_BAY_7_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 62,
                name: "Core Bay 7 Hatch Open",
                key: "CORE_BAY_7_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 309,
                name: "Control Rod Bank Pos 7 Ordered",
                key: "ROD_BANK_POS_6_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 310,
                name: "Control Rod Bank Pos 7 Actual",
                key: "ROD_BANK_POS_6_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 8",
            key: "core.bay_8",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 63,
                name: "Core Fuel 8 Temperature",
                key: "CORE_FUEL_8_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 64,
                name: "Core Fuel 8 Fissionable",
                key: "CORE_FUEL_8_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 65,
                name: "Core Fuel 8 Power Factor",
                key: "CORE_FUEL_8_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 66,
                name: "Core Bay 8 State",
                key: "CORE_BAY_8_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 67,
                name: "Core Bay 8 Hatch Open",
                key: "CORE_BAY_8_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 311,
                name: "Control Rod Bank Pos 8 Ordered",
                key: "ROD_BANK_POS_7_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 312,
                name: "Control Rod Bank Pos 8 Actual",
                key: "ROD_BANK_POS_7_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Bay 9",
            key: "core.bay_9",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 68,
                name: "Core Fuel 9 Temperature",
                key: "CORE_FUEL_9_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 69,
                name: "Core Fuel 9 Fissionable",
                key: "CORE_FUEL_9_FISSIONABLE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 70,
                name: "Core Fuel 9 Power Factor",
                key: "CORE_FUEL_9_POWER_FACTOR",
                format: :float,
                units: nil
              },
              %Metric{
                api_index: 71,
                name: "Core Bay 9 State",
                key: "CORE_BAY_9_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 72,
                name: "Core Bay 9 Hatch Open",
                key: "CORE_BAY_9_HATCH_OPEN",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 313,
                name: "Control Rod Bank Pos 9 Ordered",
                key: "ROD_BANK_POS_8_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 314,
                name: "Control Rod Bank Pos 9 Actual",
                key: "ROD_BANK_POS_8_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          },
          %Folder{
            name: "Coolant",
            key: "core.coolant",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 89,
                name: "Coolant Core State",
                key: "COOLANT_CORE_STATE",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 90,
                name: "Coolant Core Pressure",
                key: "COOLANT_CORE_PRESSURE",
                format: :float,
                units: "bar"
              },
              %Metric{
                api_index: 91,
                name: "Coolant Core Maximum Pressure",
                key: "COOLANT_CORE_MAX_PRESSURE",
                format: :float,
                units: "bar"
              },
              %Metric{
                api_index: 92,
                name: "Coolant Core Vessel Temperature",
                key: "COOLANT_CORE_VESSEL_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 93,
                name: "Coolant Core Quantity In Vessel",
                key: "COOLANT_CORE_QUANTITY_IN_VESSEL",
                format: :float,
                units: "kL"
              },
              %Metric{
                api_index: 94,
                name: "Coolant Core Primary Loop Level",
                key: "COOLANT_CORE_PRIMARY_LOOP_LEVEL",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 95,
                name: "Coolant Core Flow In",
                key: "COOLANT_CORE_FLOW_IN",
                format: :float,
                units: "L/min"
              },
              %Metric{
                api_index: 96,
                name: "Coolant Core Flow Out",
                key: "COOLANT_CORE_FLOW_OUT",
                format: :float,
                units: "L/min"
              },
              %Metric{
                api_index: 97,
                name: "Coolant Core Flow Speed",
                key: "COOLANT_CORE_FLOW_SPEED",
                format: :float,
                units: "L/min"
              },
              %Metric{
                api_index: 98,
                name: "Coolant Core Flow Ordered Speed",
                key: "COOLANT_CORE_FLOW_ORDERED_SPEED",
                format: :float,
                units: "L/min"
              },
              %Metric{
                api_index: 99,
                name: "Coolant Core Flow Reached Speed",
                key: "COOLANT_CORE_FLOW_REACHED_SPEED",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 100,
                name: "Coolant Core Quantity Circulation Pumps Present",
                key: "COOLANT_CORE_QUANTITY_CIRCULATION_PUMPS_PRESENT",
                format: :integer,
                units: "pumps"
              },
              %Metric{
                api_index: 101,
                name: "Coolant Core Quantity Freight Pumps Present",
                key: "COOLANT_CORE_QUANTITY_FREIGHT_PUMPS_PRESENT",
                format: :integer,
                units: "pumps"
              },
              %Metric{
                api_index: 102,
                name: "Coolant Core Circulation Pump 1 Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_0_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 103,
                name: "Coolant Core Circulation Pump 2 Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_1_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 104,
                name: "Coolant Core Circulation Pump 3 Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_2_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 105,
                name: "Coolant Core Circulation Pump 1 Dry Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_0_DRY_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 106,
                name: "Coolant Core Circulation Pump 2 Dry Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_1_DRY_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 107,
                name: "Coolant Core Circulation Pump 3 Dry Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_2_DRY_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 108,
                name: "Coolant Core Circulation Pump 1 Overload Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_0_OVERLOAD_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 109,
                name: "Coolant Core Circulation Pump 2 Overload Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_1_OVERLOAD_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 110,
                name: "Coolant Core Circulation Pump 3 Overload Status",
                key: "COOLANT_CORE_CIRCULATION_PUMP_2_OVERLOAD_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 111,
                name: "Coolant Core Circulation Pump 1 Ordered Speed",
                key: "COOLANT_CORE_CIRCULATION_PUMP_0_ORDERED_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 112,
                name: "Coolant Core Circulation Pump 2 Ordered Speed",
                key: "COOLANT_CORE_CIRCULATION_PUMP_1_ORDERED_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 113,
                name: "Coolant Core Circulation Pump 3 Ordered Speed",
                key: "COOLANT_CORE_CIRCULATION_PUMP_2_ORDERED_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 114,
                name: "Coolant Core Circulation Pump 1 Speed",
                key: "COOLANT_CORE_CIRCULATION_PUMP_0_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 115,
                name: "Coolant Core Circulation Pump 2 Speed",
                key: "COOLANT_CORE_CIRCULATION_PUMP_1_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 116,
                name: "Coolant Core Circulation Pump 3 Speed",
                key: "COOLANT_CORE_CIRCULATION_PUMP_2_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 288,
                name: "Coolant Core Circulation Pump 1 Capacity",
                key: "COOLANT_CORE_CIRCULATION_PUMP_0_CAPACITY",
                format: :float,
                units: "L/m"
              },
              %Metric{
                api_index: 289,
                name: "Coolant Core Circulation Pump 2 Capacity",
                key: "COOLANT_CORE_CIRCULATION_PUMP_1_CAPACITY",
                format: :float,
                units: "L/m"
              },
              %Metric{
                api_index: 290,
                name: "Coolant Core Circulation Pump 3 Capacity",
                key: "COOLANT_CORE_CIRCULATION_PUMP_2_CAPACITY",
                format: :float,
                units: "L/m"
              }
            ]
          },
          %Folder{
            name: "Rods",
            key: "core.rods",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 117,
                name: "Control Rods Status",
                key: "RODS_STATUS",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 118,
                name: "Control Rods Movement Speed",
                key: "RODS_MOVEMENT_SPEED",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 119,
                name: "Control Rods Movement Speed Decreased High Temperature",
                key: "RODS_MOVEMENT_SPEED_DECREASED_HIGH_TEMPERATURE",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 120,
                name: "Control Rods Deformed",
                key: "RODS_DEFORMED",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 121,
                name: "Control Rods Temperature",
                key: "RODS_TEMPERATURE",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 122,
                name: "Control Rods Maximum Temperature",
                key: "RODS_MAX_TEMPERATURE",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 123,
                name: "Control Rods Pos Ordered",
                key: "RODS_POS_ORDERED",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 124,
                name: "Control Rods Pos Actual",
                key: "RODS_POS_ACTUAL",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 125,
                name: "Control Rods Pos Reached",
                key: "RODS_POS_REACHED",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 126,
                name: "Control Rods Quantity",
                key: "RODS_QUANTITY",
                format: :integer,
                units: "rods"
              },
              %Metric{
                api_index: 127,
                name: "Control Rods Aligned",
                key: "RODS_ALIGNED",
                format: :string,
                units: nil
              }
            ]
          }
        ],
        metrics: [
          %Metric{
            api_index: 7,
            name: "Core Temperature",
            key: "CORE_TEMP",
            format: :float,
            units: "℃"
          },
          %Metric{
            api_index: 8,
            name: "Core Temperature Operative",
            key: "CORE_TEMP_OPERATIVE",
            format: :float,
            units: "℃"
          },
          %Metric{
            api_index: 9,
            name: "Core Temperature Maximum",
            key: "CORE_TEMP_MAX",
            format: :float,
            units: "℃"
          },
          %Metric{
            api_index: 10,
            name: "Core Temperature Minimum",
            key: "CORE_TEMP_MIN",
            format: :float,
            units: "℃"
          },
          %Metric{
            api_index: 11,
            name: "Core Temperature Residual",
            key: "CORE_TEMP_RESIDUAL",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 12,
            name: "Core Pressure",
            key: "CORE_PRESSURE",
            format: :float,
            units: "bar"
          },
          %Metric{
            api_index: 13,
            name: "Core Pressure Maximum",
            key: "CORE_PRESSURE_MAX",
            format: :float,
            units: "bar"
          },
          %Metric{
            api_index: 14,
            name: "Core Pressure Operative",
            key: "CORE_PRESSURE_OPERATIVE",
            format: :float,
            units: "bar"
          },
          %Metric{
            api_index: 15,
            name: "Core Integrity",
            key: "CORE_INTEGRITY",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 16,
            name: "Core Wear",
            key: "CORE_WEAR",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 17,
            name: "Core State",
            key: "CORE_STATE",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 18,
            name: "Core State Criticality",
            key: "CORE_STATE_CRITICALITY",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 19,
            name: "Core Critical Mass Reached",
            key: "CORE_CRITICAL_MASS_REACHED",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 20,
            name: "Core Critical Mass Reached Counter",
            key: "CORE_CRITICAL_MASS_REACHED_COUNTER",
            format: :integer,
            units: "x"
          },
          %Metric{
            api_index: 21,
            name: "Core Imminent Fusion",
            key: "CORE_IMMINENT_FUSION",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 22,
            name: "Core Ready For Start",
            key: "CORE_READY_FOR_START",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 23,
            name: "Core Steam Present",
            key: "CORE_STEAM_PRESENT",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 24,
            name: "Core High Steam Present",
            key: "CORE_HIGH_STEAM_PRESENT",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 25,
            name: "Core Fuel Average Fissionable",
            key: "CORE_FUEL_AVG_FISSIONABLE",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 26,
            name: "Core Fuel Average Temperature",
            key: "CORE_FUEL_AVG_TEMPERATURE",
            format: :float,
            units: "℃"
          },
          %Metric{
            api_index: 27,
            name: "Core Fuel Average Power Factor",
            key: "CORE_FUEL_AVG_POWER_FACTOR",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 87,
            name: "Core Pool Pump",
            key: "CORE_POOL_PUMP",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 185,
            name: "Core Factor",
            key: "CORE_FACTOR",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 186,
            name: "Core Factor Change",
            key: "CORE_FACTOR_CHANGE",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 187,
            name: "Core Operation Mode",
            key: "CORE_OPERATION_MODE",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 188,
            name: "Core Iodine Generation",
            key: "CORE_IODINE_GENERATION",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 189,
            name: "Core Iodine Cumulative",
            key: "CORE_IODINE_CUMULATIVE",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 190,
            name: "Core Xenon Generation",
            key: "CORE_XENON_GENERATION",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 191,
            name: "Core Xenon Cumulative",
            key: "CORE_XENON_CUMULATIVE",
            format: :float,
            units: nil
          },
          %Metric{
            api_index: 250,
            name: "Core Pool Coolant Tank Volume",
            key: "CORE_POOL_COOLANT_TANK_VOLUME",
            format: :float,
            units: "L"
          },
          %Metric{
            api_index: 251,
            name: "Core Primary Circuit Cooling Tank Volume",
            key: "CORE_PRIMARY_CIRCUIT_COOLING_TANK_VOLUME",
            format: :float,
            units: "L"
          },
          %Metric{
            api_index: 252,
            name: "Core External Coolant Reservoir Volume",
            key: "CORE_EXTERNAL_COOLANT_RESERVOIR_VOLUME",
            format: :float,
            units: "kL"
          }
        ]
      },
      %Folder{
        name: "Power",
        key: "power",
        subfolders: [
          %Folder{
            name: "Resistor Banks",
            key: "power.resistor_banks",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 161,
                name: "Resistor Bank Divert Surplus From",
                key: "RES_DIVERT_SURPLUS_FROM_MW",
                format: :float,
                units: "MW"
              },
              %Metric{
                api_index: 162,
                name: "Resistor Bank Effectively Derived Energy",
                key: "RES_EFFECTIVELY_DERIVED_ENERGY_MW",
                format: :float,
                units: "MW"
              },
              %Metric{
                api_index: 163,
                name: "Resistor Bank Absorption Capacity",
                key: "RES_ABSORPTION_CAPACITY_MW",
                format: :float,
                units: "MW"
              },
              %Metric{
                api_index: 164,
                name: "Resistor Bank 01 Switch",
                key: "RESISTOR_BANK_01_SWITCH",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 165,
                name: "Resistor Bank 02 Switch",
                key: "RESISTOR_BANK_02_SWITCH",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 166,
                name: "Resistor Bank 03 Switch",
                key: "RESISTOR_BANK_03_SWITCH",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 167,
                name: "Resistor Bank 04 Switch",
                key: "RESISTOR_BANK_04_SWITCH",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 168,
                name: "Resistor Banks Main Switch",
                key: "RESISTOR_BANKS_MAIN_SWITCH",
                format: :boolean,
                units: nil
              }
            ]
          }
        ],
        metrics: [
          %Metric{
            api_index: 180,
            name: "Power From Turbine",
            key: "POWER_FROM_TURBINE_KW",
            format: :float,
            units: "kW"
          },
          %Metric{
            api_index: 181,
            name: "Power From External",
            key: "POWER_FROM_EXTERNAL_KW",
            format: :float,
            units: "kW"
          },
          %Metric{
            api_index: 277,
            name: "Power Demand",
            key: "POWER_DEMAND_MW",
            format: :float,
            units: "MW"
          },
          %Metric{
            api_index: 278,
            name: "Power Maximum Theoretical Final Plant Output",
            key: "POWER_MAX_THEORETICAL_FINAL_PLANT_OUTPUT_MW",
            format: :float,
            units: "MW"
          },
          %Metric{
            api_index: 279,
            name: "Power Maximum Theoretical Plant Output",
            key: "POWER_MAX_THEORETICAL_PLANT_OUTPUT_MW",
            format: :float,
            units: "MW"
          }
        ]
      },
      %Folder{
        name: "Emergency Power",
        key: "emergency_power",
        subfolders: [
          %Folder{
            name: "Generator 1",
            key: "emergency_power.generator_1",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 170,
                name: "Emergency Generator 1 Mode",
                key: "EMERGENCY_GENERATOR_1_MODE",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 171,
                name: "Emergency Generator 1 Status",
                key: "EMERGENCY_GENERATOR_1_STATUS",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 172,
                name: "Emergency Generator 1 Pressurizer",
                key: "EMERGENCY_GENERATOR_1_PRESSURIZER",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 173,
                name: "Emergency Generator 1 Fuel",
                key: "EMERGENCY_GENERATOR_1_FUEL",
                format: :integer,
                units: "L"
              },
              %Metric{
                api_index: 174,
                name: "Emergency Generator 1 Maintenance Needed",
                key: "EMERGENCY_GENERATOR_1_MAINTENANCE_NEEDED",
                format: :boolean,
                units: nil
              }
            ]
          },
          %Folder{
            name: "Generator 2",
            key: "emergency_power.generator_2",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 175,
                name: "Emergency Generator 2 Mode",
                key: "EMERGENCY_GENERATOR_2_MODE",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 176,
                name: "Emergency Generator 2 Status",
                key: "EMERGENCY_GENERATOR_2_STATUS",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 177,
                name: "Emergency Generator 2 Pressurizer",
                key: "EMERGENCY_GENERATOR_2_PRESSURIZER",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 178,
                name: "Emergency Generator 2 Fuel",
                key: "EMERGENCY_GENERATOR_2_FUEL",
                format: :integer,
                units: "L"
              },
              %Metric{
                api_index: 179,
                name: "Emergency Generator 2 Maintenance Needed",
                key: "EMERGENCY_GENERATOR_2_MAINTENANCE_NEEDED",
                format: :boolean,
                units: nil
              }
            ]
          }
        ],
        metrics: [
          %Metric{
            api_index: 182,
            name: "Emergency Generator Power Output",
            key: "EMERGENCY_GENERATOR_POWER_OUTPUT_KW",
            format: :float,
            units: "kW"
          },
          %Metric{
            api_index: 183,
            name: "Emergency Batteries Power Output",
            key: "EMERGENCY_BATTERIES_POWER_OUTPUT_KW",
            format: :float,
            units: "kW"
          },
          %Metric{
            api_index: 184,
            name: "Emergency Batteries Mode",
            key: "EMERGENCY_BATTERIES_MODE",
            format: :integer,
            units: nil
          }
        ]
      },
      %Folder{
        name: "Chemicals",
        key: "chemicals",
        subfolders: [],
        metrics: [
          %Metric{
            api_index: 192,
            name: "Chemical Truck In Zone",
            key: "CHEM_TRUCK_IN_ZONE",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 193,
            name: "Chemical Truck Connected",
            key: "CHEM_TRUCK_CONNECTED",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 194,
            name: "Chemical Boron Dosage Ordered",
            key: "CHEM_BORON_DOSAGE_ORDERED",
            format: :float,
            units: "g/min"
          },
          %Metric{
            api_index: 195,
            name: "Chemical Boron Dosage Actual",
            key: "CHEM_BORON_DOSAGE_ACTUAL",
            format: :float,
            units: "g/min"
          },
          %Metric{
            api_index: 196,
            name: "Chemical Boron Filter Ordered",
            key: "CHEM_BORON_FILTER_ORDERED",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 197,
            name: "Chemical Boron Filter Actual",
            key: "CHEM_BORON_FILTER_ACTUAL",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 198,
            name: "Chemical Boron Ppm",
            key: "CHEM_BORON_PPM",
            format: :float,
            units: "ppm"
          },
          %Metric{
            api_index: 199,
            name: "Chemical Dosing Pump Status",
            key: "CHEMICAL_DOSING_PUMP_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 200,
            name: "Chemical Dosing Pump Dry Status",
            key: "CHEMICAL_DOSING_PUMP_DRY_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 201,
            name: "Chemical Dosing Pump Overload Status",
            key: "CHEMICAL_DOSING_PUMP_OVERLOAD_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 202,
            name: "Chemical Filter Pump Status",
            key: "CHEMICAL_FILTER_PUMP_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 203,
            name: "Chemical Filter Pump Dry Status",
            key: "CHEMICAL_FILTER_PUMP_DRY_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 204,
            name: "Chemical Filter Pump Overload Status",
            key: "CHEMICAL_FILTER_PUMP_OVERLOAD_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 205,
            name: "Chemical Cleaning Pump Status",
            key: "CHEMICAL_CLEANING_PUMP_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 206,
            name: "Chemical Cleaning Pump Dry Status",
            key: "CHEMICAL_CLEANING_PUMP_DRY_STATUS",
            format: :integer,
            units: nil
          },
          %Metric{
            api_index: 207,
            name: "Chemical Cleaning Pump Overload Status",
            key: "CHEMICAL_CLEANING_PUMP_OVERLOAD_STATUS",
            format: :integer,
            units: nil
          }
        ]
      },
      %Folder{
        name: "Secondary",
        key: "secondary",
        subfolders: [
          %Folder{
            name: "Loop 1",
            key: "secondary.loop_1",
            subfolders: [
              %Folder{
                name: "Generator",
                key: "secondary.loop_1.generator",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 128,
                    name: "Generator 1 Power",
                    key: "GENERATOR_0_KW",
                    format: :float,
                    units: "kW"
                  },
                  %Metric{
                    api_index: 131,
                    name: "Generator 1 Voltage",
                    key: "GENERATOR_0_V",
                    format: :float,
                    units: "V"
                  },
                  %Metric{
                    api_index: 134,
                    name: "Generator 1 Amperage",
                    key: "GENERATOR_0_A",
                    format: :float,
                    units: "A"
                  },
                  %Metric{
                    api_index: 137,
                    name: "Generator 1 Hertz",
                    key: "GENERATOR_0_HERTZ",
                    format: :float,
                    units: "Hz"
                  },
                  %Metric{
                    api_index: 140,
                    name: "Generator 1 Breaker",
                    key: "GENERATOR_0_BREAKER",
                    format: :boolean,
                    units: nil
                  }
                ]
              },
              %Folder{
                name: "Turbine",
                key: "secondary.loop_1.turbine",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 143,
                    name: "Steam Turbine 1 RPM",
                    key: "STEAM_TURBINE_0_RPM",
                    format: :float,
                    units: "RPM"
                  },
                  %Metric{
                    api_index: 146,
                    name: "Steam Turbine 1 Temperature",
                    key: "STEAM_TURBINE_0_TEMPERATURE",
                    format: :float,
                    units: "℃"
                  },
                  %Metric{
                    api_index: 149,
                    name: "Steam Turbine 1 Pressure",
                    key: "STEAM_TURBINE_0_PRESSURE",
                    format: :float,
                    units: "bar"
                  },
                  %Metric{
                    api_index: 152,
                    name: "Steam Turbine 1 Torque",
                    key: "STEAM_TURBINE_0_TORQUE",
                    format: :float,
                    units: "%"
                  },
                  %Metric{
                    api_index: 155,
                    name: "Steam Turbine 1 Installed",
                    key: "STEAM_TURBINE_0_INSTALLED",
                    format: :boolean,
                    units: nil
                  },
                  %Metric{
                    api_index: 259,
                    name: "Steam Turbine 1 Bypass Actual",
                    key: "STEAM_TURBINE_0_BYPASS_ACTUAL",
                    format: :float,
                    units: "%"
                  }
                ]
              },
              %Folder{
                name: "Steam",
                key: "secondary.loop_1.steam",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 158,
                    name: "Steam Generator 1 Status",
                    key: "STEAM_GEN_0_STATUS",
                    format: :integer,
                    units: nil
                  },
                  %Metric{
                    api_index: 256,
                    name: "MSCV 1 Opening Actual",
                    key: "MSCV_0_OPENING_ACTUAL",
                    format: :float,
                    units: "%"
                  },
                  %Metric{
                    api_index: 262,
                    name: "Steam Generator 1 Outlet",
                    key: "STEAM_GEN_0_OUTLET",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 263,
                    name: "Steam Generator 1 Evaporated",
                    key: "STEAM_GEN_0_EVAPORATED",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 264,
                    name: "Steam Generator 1 Boiling Point",
                    key: "STEAM_GEN_0_BOILING_POINT",
                    format: :float,
                    units: "℃"
                  },
                  %Metric{
                    api_index: 265,
                    name: "Steam Generator 1 Inlet",
                    key: "STEAM_GEN_0_INLET",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 266,
                    name: "Steam Generator 1 Return Flow Plus Condensed",
                    key: "STEAM_GEN_0_RETURN_FLOW_PLUS_CONDENSED",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 285,
                    name: "Steam Generator 1 Vent Switch",
                    key: "STEAM_GEN_0_VENT_SWITCH",
                    format: :boolean,
                    units: nil
                  }
                ]
              }
            ],
            metrics: [
              %Metric{
                api_index: 208,
                name: "Coolant Secondary Circulation Pump 1 Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_0_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 211,
                name: "Coolant Secondary Circulation Pump 1 Dry Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_0_DRY_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 214,
                name: "Coolant Secondary Circulation Pump 1 Overload Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_0_OVERLOAD_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 217,
                name: "Coolant Secondary Circulation Pump 1 Ordered Speed",
                key: "COOLANT_SEC_CIRCULATION_PUMP_0_ORDERED_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 220,
                name: "Coolant Secondary Circulation Pump 1 Speed",
                key: "COOLANT_SEC_CIRCULATION_PUMP_0_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 223,
                name: "Coolant Secondary 1 Volume",
                key: "COOLANT_SEC_0_VOLUME",
                format: :float,
                units: "hL"
              },
              %Metric{
                api_index: 226,
                name: "Coolant Secondary 1 Liquid Volume",
                key: "COOLANT_SEC_0_LIQUID_VOLUME",
                format: :float,
                units: "hL"
              },
              %Metric{
                api_index: 229,
                name: "Coolant Secondary 1 Pressure",
                key: "COOLANT_SEC_0_PRESSURE",
                format: :float,
                units: "bar"
              },
              %Metric{
                api_index: 232,
                name: "Coolant Secondary 1 Temperature",
                key: "COOLANT_SEC_0_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 291,
                name: "Coolant Secondary Circulation Pump 1 Capacity",
                key: "COOLANT_SEC_CIRCULATION_PUMP_0_CAPACITY",
                format: :float,
                units: "L/m"
              }
            ]
          },
          %Folder{
            name: "Loop 2",
            key: "secondary.loop_2",
            subfolders: [
              %Folder{
                name: "Generator",
                key: "secondary.loop_2.generator",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 129,
                    name: "Generator 2 Power",
                    key: "GENERATOR_1_KW",
                    format: :float,
                    units: "kW"
                  },
                  %Metric{
                    api_index: 132,
                    name: "Generator 2 Voltage",
                    key: "GENERATOR_1_V",
                    format: :float,
                    units: "V"
                  },
                  %Metric{
                    api_index: 135,
                    name: "Generator 2 Amperage",
                    key: "GENERATOR_1_A",
                    format: :float,
                    units: "A"
                  },
                  %Metric{
                    api_index: 138,
                    name: "Generator 2 Hertz",
                    key: "GENERATOR_1_HERTZ",
                    format: :float,
                    units: "Hz"
                  },
                  %Metric{
                    api_index: 141,
                    name: "Generator 2 Breaker",
                    key: "GENERATOR_1_BREAKER",
                    format: :boolean,
                    units: nil
                  }
                ]
              },
              %Folder{
                name: "Turbine",
                key: "secondary.loop_2.turbine",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 144,
                    name: "Steam Turbine 2 RPM",
                    key: "STEAM_TURBINE_1_RPM",
                    format: :float,
                    units: "RPM"
                  },
                  %Metric{
                    api_index: 147,
                    name: "Steam Turbine 2 Temperature",
                    key: "STEAM_TURBINE_1_TEMPERATURE",
                    format: :float,
                    units: "℃"
                  },
                  %Metric{
                    api_index: 150,
                    name: "Steam Turbine 2 Pressure",
                    key: "STEAM_TURBINE_1_PRESSURE",
                    format: :float,
                    units: "bar"
                  },
                  %Metric{
                    api_index: 153,
                    name: "Steam Turbine 2 Torque",
                    key: "STEAM_TURBINE_1_TORQUE",
                    format: :float,
                    units: "%"
                  },
                  %Metric{
                    api_index: 156,
                    name: "Steam Turbine 2 Installed",
                    key: "STEAM_TURBINE_1_INSTALLED",
                    format: :boolean,
                    units: nil
                  },
                  %Metric{
                    api_index: 260,
                    name: "Steam Turbine 2 Bypass Actual",
                    key: "STEAM_TURBINE_1_BYPASS_ACTUAL",
                    format: :float,
                    units: "%"
                  }
                ]
              },
              %Folder{
                name: "Steam",
                key: "secondary.loop_2.steam",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 159,
                    name: "Steam Generator 2 Status",
                    key: "STEAM_GEN_1_STATUS",
                    format: :integer,
                    units: nil
                  },
                  %Metric{
                    api_index: 257,
                    name: "MSCV 2 Opening Actual",
                    key: "MSCV_1_OPENING_ACTUAL",
                    format: :float,
                    units: "%"
                  },
                  %Metric{
                    api_index: 267,
                    name: "Steam Generator 2 Outlet",
                    key: "STEAM_GEN_1_OUTLET",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 268,
                    name: "Steam Generator 2 Evaporated",
                    key: "STEAM_GEN_1_EVAPORATED",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 269,
                    name: "Steam Generator 2 Boiling Point",
                    key: "STEAM_GEN_1_BOILING_POINT",
                    format: :float,
                    units: "℃"
                  },
                  %Metric{
                    api_index: 270,
                    name: "Steam Generator 2 Inlet",
                    key: "STEAM_GEN_1_INLET",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 271,
                    name: "Steam Generator 2 Return Flow Plus Condensed",
                    key: "STEAM_GEN_1_RETURN_FLOW_PLUS_CONDENSED",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 286,
                    name: "Steam Generator 2 Vent Switch",
                    key: "STEAM_GEN_1_VENT_SWITCH",
                    format: :boolean,
                    units: nil
                  }
                ]
              }
            ],
            metrics: [
              %Metric{
                api_index: 209,
                name: "Coolant Secondary Circulation Pump 2 Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_1_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 212,
                name: "Coolant Secondary Circulation Pump 2 Dry Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_1_DRY_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 215,
                name: "Coolant Secondary Circulation Pump 2 Overload Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_1_OVERLOAD_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 218,
                name: "Coolant Secondary Circulation Pump 2 Ordered Speed",
                key: "COOLANT_SEC_CIRCULATION_PUMP_1_ORDERED_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 221,
                name: "Coolant Secondary Circulation Pump 2 Speed",
                key: "COOLANT_SEC_CIRCULATION_PUMP_1_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 224,
                name: "Coolant Secondary 2 Volume",
                key: "COOLANT_SEC_1_VOLUME",
                format: :float,
                units: "hL"
              },
              %Metric{
                api_index: 227,
                name: "Coolant Secondary 2 Liquid Volume",
                key: "COOLANT_SEC_1_LIQUID_VOLUME",
                format: :float,
                units: "hL"
              },
              %Metric{
                api_index: 230,
                name: "Coolant Secondary 2 Pressure",
                key: "COOLANT_SEC_1_PRESSURE",
                format: :float,
                units: "bar"
              },
              %Metric{
                api_index: 233,
                name: "Coolant Secondary 2 Temperature",
                key: "COOLANT_SEC_1_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 292,
                name: "Coolant Secondary Circulation Pump 2 Capacity",
                key: "COOLANT_SEC_CIRCULATION_PUMP_1_CAPACITY",
                format: :float,
                units: "L/m"
              }
            ]
          },
          %Folder{
            name: "Loop 3",
            key: "secondary.loop_3",
            subfolders: [
              %Folder{
                name: "Generator",
                key: "secondary.loop_3.generator",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 130,
                    name: "Generator 3 Power",
                    key: "GENERATOR_2_KW",
                    format: :float,
                    units: "kW"
                  },
                  %Metric{
                    api_index: 133,
                    name: "Generator 3 Voltage",
                    key: "GENERATOR_2_V",
                    format: :float,
                    units: "V"
                  },
                  %Metric{
                    api_index: 136,
                    name: "Generator 3 Amperage",
                    key: "GENERATOR_2_A",
                    format: :float,
                    units: "A"
                  },
                  %Metric{
                    api_index: 139,
                    name: "Generator 3 Hertz",
                    key: "GENERATOR_2_HERTZ",
                    format: :float,
                    units: "Hz"
                  },
                  %Metric{
                    api_index: 142,
                    name: "Generator 3 Breaker",
                    key: "GENERATOR_2_BREAKER",
                    format: :boolean,
                    units: nil
                  }
                ]
              },
              %Folder{
                name: "Turbine",
                key: "secondary.loop_3.turbine",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 145,
                    name: "Steam Turbine 3 RPM",
                    key: "STEAM_TURBINE_2_RPM",
                    format: :float,
                    units: "RPM"
                  },
                  %Metric{
                    api_index: 148,
                    name: "Steam Turbine 3 Temperature",
                    key: "STEAM_TURBINE_2_TEMPERATURE",
                    format: :float,
                    units: "℃"
                  },
                  %Metric{
                    api_index: 151,
                    name: "Steam Turbine 3 Pressure",
                    key: "STEAM_TURBINE_2_PRESSURE",
                    format: :float,
                    units: "bar"
                  },
                  %Metric{
                    api_index: 154,
                    name: "Steam Turbine 3 Torque",
                    key: "STEAM_TURBINE_2_TORQUE",
                    format: :float,
                    units: "%"
                  },
                  %Metric{
                    api_index: 157,
                    name: "Steam Turbine 3 Installed",
                    key: "STEAM_TURBINE_2_INSTALLED",
                    format: :boolean,
                    units: nil
                  },
                  %Metric{
                    api_index: 261,
                    name: "Steam Turbine 3 Bypass Actual",
                    key: "STEAM_TURBINE_2_BYPASS_ACTUAL",
                    format: :float,
                    units: "%"
                  }
                ]
              },
              %Folder{
                name: "Steam",
                key: "secondary.loop_3.steam",
                subfolders: [],
                metrics: [
                  %Metric{
                    api_index: 160,
                    name: "Steam Generator 3 Status",
                    key: "STEAM_GEN_2_STATUS",
                    format: :integer,
                    units: nil
                  },
                  %Metric{
                    api_index: 258,
                    name: "MSCV 3 Opening Actual",
                    key: "MSCV_2_OPENING_ACTUAL",
                    format: :float,
                    units: "%"
                  },
                  %Metric{
                    api_index: 272,
                    name: "Steam Generator 3 Outlet",
                    key: "STEAM_GEN_2_OUTLET",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 273,
                    name: "Steam Generator 3 Evaporated",
                    key: "STEAM_GEN_2_EVAPORATED",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 274,
                    name: "Steam Generator 3 Boiling Point",
                    key: "STEAM_GEN_2_BOILING_POINT",
                    format: :float,
                    units: "℃"
                  },
                  %Metric{
                    api_index: 275,
                    name: "Steam Generator 3 Inlet",
                    key: "STEAM_GEN_2_INLET",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 276,
                    name: "Steam Generator 3 Return Flow Plus Condensed",
                    key: "STEAM_GEN_2_RETURN_FLOW_PLUS_CONDENSED",
                    format: :float,
                    units: "kg/min"
                  },
                  %Metric{
                    api_index: 287,
                    name: "Steam Generator 3 Vent Switch",
                    key: "STEAM_GEN_2_VENT_SWITCH",
                    format: :boolean,
                    units: nil
                  }
                ]
              }
            ],
            metrics: [
              %Metric{
                api_index: 210,
                name: "Coolant Secondary Circulation Pump 3 Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_2_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 213,
                name: "Coolant Secondary Circulation Pump 3 Dry Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_2_DRY_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 216,
                name: "Coolant Secondary Circulation Pump 3 Overload Status",
                key: "COOLANT_SEC_CIRCULATION_PUMP_2_OVERLOAD_STATUS",
                format: :integer,
                units: nil
              },
              %Metric{
                api_index: 219,
                name: "Coolant Secondary Circulation Pump 3 Ordered Speed",
                key: "COOLANT_SEC_CIRCULATION_PUMP_2_ORDERED_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 222,
                name: "Coolant Secondary Circulation Pump 3 Speed",
                key: "COOLANT_SEC_CIRCULATION_PUMP_2_SPEED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 225,
                name: "Coolant Secondary 3 Volume",
                key: "COOLANT_SEC_2_VOLUME",
                format: :float,
                units: "hL"
              },
              %Metric{
                api_index: 228,
                name: "Coolant Secondary 3 Liquid Volume",
                key: "COOLANT_SEC_2_LIQUID_VOLUME",
                format: :float,
                units: "hL"
              },
              %Metric{
                api_index: 231,
                name: "Coolant Secondary 3 Pressure",
                key: "COOLANT_SEC_2_PRESSURE",
                format: :float,
                units: "bar"
              },
              %Metric{
                api_index: 234,
                name: "Coolant Secondary 3 Temperature",
                key: "COOLANT_SEC_2_TEMPERATURE",
                format: :float,
                units: "℃"
              },
              %Metric{
                api_index: 293,
                name: "Coolant Secondary Circulation Pump 3 Capacity",
                key: "COOLANT_SEC_CIRCULATION_PUMP_2_CAPACITY",
                format: :float,
                units: "L/m"
              }
            ]
          }
        ],
        metrics: []
      },
      %Folder{
        name: "Condenser",
        key: "condenser",
        subfolders: [
          %Folder{
            name: "Vacuum",
            key: "condenser.vacuum",
            subfolders: [],
            metrics: [
              %Metric{
                api_index: 73,
                name: "Condenser Vacuum",
                key: "CONDENSER_VACUUM",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 74,
                name: "Condenser Vacuum Relief Valve Opening",
                key: "CONDENSER_VACUUM_RELIEF_VALVE_OPENING",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 75,
                name: "Condenser Vacuum Pump Active",
                key: "CONDENSER_VACUUM_PUMP_ACTIVE",
                format: :boolean,
                units: nil
              },
              %Metric{
                api_index: 76,
                name: "Condenser Vacuum Pump Mode",
                key: "CONDENSER_VACUUM_PUMP_MODE",
                format: :string,
                units: nil
              },
              %Metric{
                api_index: 77,
                name: "Condenser Vacuum Pump Power",
                key: "CONDENSER_VACUUM_PUMP_POWER",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 78,
                name: "Vacuum Retention Tank Volume",
                key: "VACUUM_RETENTION_TANK_VOLUME",
                format: :float,
                units: "L"
              },
              %Metric{
                api_index: 79,
                name: "Steam Ejector Motive",
                key: "STEAM_EJECTOR_MOTIVE",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 80,
                name: "Vacuum Retention Tank Pressure",
                key: "VACUUM_RETENTION_TANK_PRESSURE",
                format: :float,
                units: "bar"
              },
              %Metric{
                api_index: 81,
                name: "Steam Ejector Startup Motive Valve Ordered",
                key: "STEAM_EJECTOR_STARTUP_MOTIVE_VALVE_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 82,
                name: "Steam Ejector Startup Motive Valve Actual",
                key: "STEAM_EJECTOR_STARTUP_MOTIVE_VALVE_ACTUAL",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 83,
                name: "Steam Ejector Operational Motive Valve Ordered",
                key: "STEAM_EJECTOR_OPERATIONAL_MOTIVE_VALVE_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 84,
                name: "Steam Ejector Operational Motive Valve Actual",
                key: "STEAM_EJECTOR_OPERATIONAL_MOTIVE_VALVE_ACTUAL",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 85,
                name: "Steam Ejector Condenser Return Valve Ordered",
                key: "STEAM_EJECTOR_CONDENSER_RETURN_VALVE_ORDERED",
                format: :float,
                units: "%"
              },
              %Metric{
                api_index: 86,
                name: "Steam Ejector Condenser Return Valve Actual",
                key: "STEAM_EJECTOR_CONDENSER_RETURN_VALVE_ACTUAL",
                format: :float,
                units: "%"
              }
            ]
          }
        ],
        metrics: [
          %Metric{
            api_index: 235,
            name: "Condenser Circulation Pump Overload Status",
            key: "CONDENSER_CIRCULATION_PUMP_OVERLOAD_STATUS",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 236,
            name: "Condenser Circulation Pump Speed",
            key: "CONDENSER_CIRCULATION_PUMP_SPEED",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 237,
            name: "Condenser Circulation Pump Ordered Speed",
            key: "CONDENSER_CIRCULATION_PUMP_ORDERED_SPEED",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 238,
            name: "Condenser Temperature",
            key: "CONDENSER_TEMPERATURE",
            format: :float,
            units: "℃"
          },
          %Metric{
            api_index: 239,
            name: "Condenser Volume",
            key: "CONDENSER_VOLUME",
            format: :float,
            units: "hL"
          },
          %Metric{
            api_index: 240,
            name: "Condenser Vapor Volume",
            key: "CONDENSER_VAPOR_VOLUME",
            format: :float,
            units: "hL"
          },
          %Metric{
            api_index: 241,
            name: "Condenser Condensate Flow Rate",
            key: "CONDENSER_CONDENSATE_FLOW_RATE",
            format: :float,
            units: "kg/min"
          },
          %Metric{
            api_index: 242,
            name: "Condenser Extraction Flow Rate",
            key: "CONDENSER_EXTRACTION_FLOW_RATE",
            format: :float,
            units: "kg/min"
          },
          %Metric{
            api_index: 243,
            name: "Condenser Coolant Evaporated",
            key: "CONDENSER_COOLANT_EVAPORATED",
            format: :float,
            units: "kg/min"
          },
          %Metric{
            api_index: 244,
            name: "Condenser Pressure",
            key: "CONDENSER_PRESSURE",
            format: :float,
            units: "bar"
          },
          %Metric{
            api_index: 245,
            name: "Condenser Circulation Pump Active",
            key: "CONDENSER_CIRCULATION_PUMP_ACTIVE",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 283,
            name: "Condenser Circulation Pump Switch",
            key: "CONDENSER_CIRCULATION_PUMP_SWITCH",
            format: :boolean,
            units: nil
          }
        ]
      },
      %Folder{
        name: "Freight Pumps",
        key: "freight_pumps",
        subfolders: [],
        metrics: [
          %Metric{
            api_index: 246,
            name: "Freight Pump Condenser Active",
            key: "FREIGHT_PUMP_CONDENSER_ACTIVE",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 247,
            name: "Freight Pump Internal Active",
            key: "FREIGHT_PUMP_INTERNAL_ACTIVE",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 248,
            name: "Freight Pump External Active",
            key: "FREIGHT_PUMP_EXTERNAL_ACTIVE",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 249,
            name: "Freight Pump Feedwater Active",
            key: "FREIGHT_PUMP_FEEDWATER_ACTIVE",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 280,
            name: "Freight Pump Condenser Switch",
            key: "FREIGHT_PUMP_CONDENSER_SWITCH",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 281,
            name: "Freight Pump Internal Switch",
            key: "FREIGHT_PUMP_INTERNAL_SWITCH",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 282,
            name: "Freight Pump External Switch",
            key: "FREIGHT_PUMP_EXTERNAL_SWITCH",
            format: :boolean,
            units: nil
          },
          %Metric{
            api_index: 284,
            name: "Freight Pump Feedwater Switch",
            key: "FREIGHT_PUMP_FEEDWATER_SWITCH",
            format: :boolean,
            units: nil
          }
        ]
      },
      %Folder{
        name: "Valves",
        key: "valves",
        subfolders: [],
        metrics: [
          %Metric{
            api_index: 253,
            name: "Valve M01 Open",
            key: "VALVE_M01_OPEN",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 254,
            name: "Valve M02 Open",
            key: "VALVE_M02_OPEN",
            format: :float,
            units: "%"
          },
          %Metric{
            api_index: 255,
            name: "Valve M03 Open",
            key: "VALVE_M03_OPEN",
            format: :float,
            units: "%"
          }
        ]
      }
    ],
    metrics: []
  }

  def root, do: @root
end
