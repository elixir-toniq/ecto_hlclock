defmodule Ecto.HLClock.Migration do
  @moduledoc """
  Ecto migration helper for adding constraints to the HLC `:binary` column to
  help ensure that only valid HLCs are stored
  """

  import Ecto.Migration, only: [create: 1, constraint: 3]

  @doc """
  Enforce the constraint that the column only stores exactly 128-bit binaries
  """
  def create_hlc_constraint(table, field) do
    create(
      constraint(
        table,
        String.to_atom("hlc_field_#{field}_size"),
        check: "length(#{field}) = 16"
      )
    )
  end
end
