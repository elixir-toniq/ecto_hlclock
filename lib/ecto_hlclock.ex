defmodule EctoHLClock do
  @moduledoc """
  Provides capability for storing HLC's in the database
  """

  @behaviour Ecto.Type

  alias HLClock.Timestamp

  @impl Ecto.Type
  def type, do: :binary

  @impl Ecto.Type
  def cast(t) when is_binary(t), do: {:ok, Timestamp.decode(t)}
  def cast(%Timestamp{} = t), do: {:ok, t}
  def cast(_), do: :error

  @impl Ecto.Type
  def load(bin), do: {:ok, Timestamp.decode(bin)}

  @impl Ecto.Type
  def dump(%Timestamp{} = t), do: {:ok, Timestamp.encode(t)}
  def dump(_), do: :error

  @impl Ecto.Type
  def equal?(%Timestamp{} = t0, %Timestamp{} = t1), do: Timestamp.compare(t0, t1) == :eq
  def equal?(nil, nil), do: true
  def equal?(_, _), do: false
end
