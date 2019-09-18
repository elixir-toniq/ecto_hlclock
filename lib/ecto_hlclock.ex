defmodule EctoHLClock do
  @moduledoc """
  Provides capability for storing HLC's in the database
  """

  @behaviour Ecto.Type

  alias HLClock.Timestamp

  def type, do: :binary

  def cast(t) when is_binary(t), do: {:ok, Timestamp.decode(t)}
  def cast(%Timestamp{} = t), do: {:ok, t}
  def cast(_), do: :error

  def load(bin), do: {:ok, Timestamp.decode(bin)}

  def dump(%Timestamp{} = t), do: {:ok, Timestamp.encode(t)}
  def dump(_), do: :error
end
