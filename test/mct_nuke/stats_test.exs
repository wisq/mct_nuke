defmodule MctNuke.StatsTest do
  use ExUnit.Case
  alias MctNuke.Stats

  test "empty stats has zero size and early timestamp" do
    stats = Stats.new()
    assert stats.size == 0
    assert stats.latest_ts == -1
  end

  test "Stats.add/2 appends values to stats" do
    stats =
      Stats.new()
      |> Stats.add(%{"TIME_STAMP" => 123})

    assert stats.size == 1
    assert stats.latest_ts == 7_380_000

    stats =
      stats
      |> Stats.add(%{"TIME_STAMP" => 124})

    assert stats.size == 2
    assert stats.latest_ts == 7_440_000
  end

  test "Stats.add/2 refuses to go back in time" do
    err =
      assert_raise(RuntimeError, fn ->
        Stats.new()
        |> Stats.add(%{"TIME_STAMP" => 124})
        |> Stats.add(%{"TIME_STAMP" => 123})
      end)

    assert err.message == "Cannot repeat or go backwards in time: 7440000 => 7380000"
  end

  test "Stats.add/2 refuses to allow repeats" do
    err =
      assert_raise(RuntimeError, fn ->
        Stats.new()
        |> Stats.add(%{"TIME_STAMP" => 123})
        |> Stats.add(%{"TIME_STAMP" => 123})
      end)

    assert err.message == "Cannot repeat or go backwards in time: 7380000 => 7380000"
  end

  test "Stats.purge_from/2 removes entries from timestamp onwards" do
    stats =
      1001..1020
      |> Enum.reduce(Stats.new(), &Stats.add(&2, %{"TIME_STAMP" => &1}))

    assert stats.size == 20
    assert stats.latest_ts == 61_200_000

    assert {stats, 10} = Stats.purge_from(stats, 1011)
    assert stats.size == 10
    assert stats.latest_ts == 60_600_000

    assert {stats, 10} = Stats.purge_from(stats, 1001)
    assert stats == Stats.new()
  end

  test "Stats.is_new?/2 returns true if timestamp changes in either direction" do
    stats =
      Stats.new()
      |> Stats.add(%{"TIME_STAMP" => 234})

    assert !Stats.is_new?(stats, 234)
    assert Stats.is_new?(stats, 235)
    assert Stats.is_new?(stats, 233)
    assert Stats.is_new?(stats, 236)

    stats =
      stats
      |> Stats.add(%{"TIME_STAMP" => 235})

    assert !Stats.is_new?(stats, 235)
    assert Stats.is_new?(stats, 234)
    assert Stats.is_new?(stats, 236)
  end

  test "Stats.history/3 with nil limits returns entire history" do
    stats =
      Stats.new()
      |> Stats.add(%{"TIME_STAMP" => 101, "CORE_TEMP" => 300})
      |> Stats.add(%{"TIME_STAMP" => 102, "CORE_TEMP" => 300})
      # deliberately skipping 103
      |> Stats.add(%{"TIME_STAMP" => 104, "CORE_TEMP" => 301})
      |> Stats.add(%{"TIME_STAMP" => 105, "CORE_TEMP" => 302})

    assert Stats.history(stats, "CORE_TEMP", nil, nil) == [
             %{id: "CORE_TEMP", timestamp: 6_060_000, value: 300},
             %{id: "CORE_TEMP", timestamp: 6_120_000, value: 300},
             %{id: "CORE_TEMP", timestamp: 6_240_000, value: 301},
             %{id: "CORE_TEMP", timestamp: 6_300_000, value: 302}
           ]
  end

  test "Stats.history/3 with min returns history after timestamp" do
    stats = generate_core_temp(201..210)

    history = Stats.history(stats, "CORE_TEMP", 12_360_000, nil)
    assert Enum.at(history, 0).timestamp == 12_360_000
    assert Enum.map(history, & &1.value) == [412, 414, 416, 418, 420]
  end

  test "Stats.history/3 with max returns history before timestamp" do
    stats = generate_core_temp(201..210)

    history = Stats.history(stats, "CORE_TEMP", nil, 12_360_000)
    assert Enum.at(history, -1).timestamp == 12_360_000
    assert Enum.map(history, & &1.value) == [402, 404, 406, 408, 410, 412]
  end

  test "Stats.history/3 with min and max returns history between timestamps" do
    stats = generate_core_temp(201..210)

    history = Stats.history(stats, "CORE_TEMP", 12_240_000, 12_360_000)
    assert Enum.at(history, 0).timestamp == 12_240_000
    assert Enum.at(history, -1).timestamp == 12_360_000
    assert Enum.map(history, & &1.value) == [408, 410, 412]
  end

  test "Stats.history/3 supports non-exact timestamps" do
    stats = generate_core_temp(201..210)

    history1 = Stats.history(stats, "CORE_TEMP", 12_180_000, 12_420_000)
    history2 = Stats.history(stats, "CORE_TEMP", 12_179_999, 12_420_001)
    assert history1 == history2
    assert Enum.count(history1) == 5

    history3 = Stats.history(stats, "CORE_TEMP", 12_180_001, 12_419_999)
    assert history3 != history1
    assert Enum.count(history3) == 3
  end

  test "Stats.history/3 supports floating point timestamps" do
    stats = generate_core_temp(201..210)

    history1 = Stats.history(stats, "CORE_TEMP", 12_180_000, 12_420_000)
    history2 = Stats.history(stats, "CORE_TEMP", 12_179_999.9999, 12_420_000.0001)
    assert history1 == history2
    assert Enum.count(history1) == 5

    history3 = Stats.history(stats, "CORE_TEMP", 12_180_000.0001, 12_419_999.9999)
    assert history3 != history1
    assert Enum.count(history3) == 3
  end

  defp generate_core_temp(range) do
    range
    |> Enum.reduce(
      Stats.new(),
      &Stats.add(&2, %{
        "TIME_STAMP" => &1,
        "CORE_TEMP" => &1 * 2
      })
    )
  end
end
