# EctoHLClock

Provides the necessary [Ecto](https://github.com/elixir-ecto/ecto) type
information for [hybrid logical clocks](https://github.com/tonic-sys/hlclock).

## Installation

Now [available in Hex](https://hex.pm/docs/publish), the package can be
installed by adding `ecto_hlclock` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecto_hlclock, "~> 0.1.0"}
  ]
end
```

## Migration

Adding an HLC column relies on using a `:binary` column type (currently, only
verified against Postgres):

```elixir
# create a required HLC column on an existing database
alter table (:your_table) do
  add :hlc_column, :binary, null: false
end

EctoHLClock.Migration.create_hlc_constraint(:your_table, :hlc_column)
```

`create_hlc_constraint`, by design, creates a deterministic naming convention
for the constraints that it enforces, so it should be compatible with
changesets. See relevant logs for more information.
