defmodule EctoHLClock.Mixfile do
  use Mix.Project

  @source_url "https://github.com/toniqsystems/ecto_hlclock"

  def project do
    [
      app: :ecto_hlclock,
      version: "0.2.1",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "EctoHLClock",
      source_url: @source_url,
      docs: [
        source_url: @source_url,
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Ecto type support for storing/retrieving HLC timestamps
    """
  end

  defp deps do
    [
      {:ecto, "~> 3.0"},
      {:ecto_sql, "~> 3.0"},
      {:hlcid, "~> 0.1"},
      {:credo, "~> 1.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :ecto_hlclock,
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Neil Menne", "Chris Keathley"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => @source_url,
        "Docs" => "http://hexdocs.pm/ecto_hlclock"
      }
    ]
  end
end
