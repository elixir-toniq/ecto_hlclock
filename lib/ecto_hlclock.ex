defmodule EctoHLClock do
  @moduledoc """
  Provides capability for storing HLC's in the database
  """

  @behaviour Ecto.Type

  alias HLClock.Timestamp

  @impl Ecto.Type
  def autogenerate, do: HLCID.generate()

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
  def equal?(%Timestamp{} = t1, %Timestamp{} = t2),
    do: Timestamp.compare(t1, t2) == :eq

  def equal?(t1, t2) when is_binary(t1) and is_binary(t2), do: t1 == t2
  def equal?(nil, nil), do: true
  def equal?(_, _), do: false

  @impl Ecto.Type
  def embed_as(_t), do: :self
end
