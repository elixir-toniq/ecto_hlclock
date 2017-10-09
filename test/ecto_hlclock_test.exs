defmodule EctoHlclockTest do
  use ExUnit.Case

  alias HLClock.Timestamp

  describe "EctoHLClock" do
    test "cast/1" do
      {:ok, t0} = Timestamp.new(System.os_time(:millisecond), 0, 0)
      {:ok, t1} = EctoHLClock.cast(t0)
      assert t0 == t1

      {:ok, t2} = t0 |> Timestamp.encode() |> EctoHLClock.cast
      assert t0 == t2
    end

    test "load/1 and dump/1 are symmetric" do
      {:ok, t0} = Timestamp.new(System.os_time(:millisecond), 0, 0)
      {:ok, bin} = EctoHLClock.dump(t0)
      {:ok, t1} = EctoHLClock.load(bin)
      assert Timestamp.compare(t0, t1) == :eq
    end
  end
end
