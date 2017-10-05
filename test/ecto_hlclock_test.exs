defmodule EctoHlclockTest do
  use ExUnit.Case

  alias HLClock.Timestamp

  test "cast timestamp" do
    {:ok, t0} = Timestamp.new(System.os_time(:millisecond), 0, 0)
    {:ok, t1} = EctoHLClock.cast(t0)
    assert t0 == t1

    {:ok, t2} = t0 |> Timestamp.encode() |> EctoHLClock.cast
    assert t0 == t2
  end
end
