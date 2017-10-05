defmodule EctoHLClock.Migration.EctoHLCMigration do
  @moduledoc """

  """

  import Ecto.Migration, only: [create: 1, constraint: 3]

  def create_hlc_constraint(table, field) when is_atom(field),
    do: create_hlc_constraint(table, Atom.to_string(field))
  def create_hlc_constraint(table, field) when is_binary(field)
    do
    create constraint(table,
      String.to_atom("hlc_field_#{field}_size"),
      check: "length(#{field}) = 16")
  end
end
