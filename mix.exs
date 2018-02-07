defmodule EctoHlclock.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_hlclock,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Ecto.HLClock",
      source_url: "https://github.com/toniqsystems/ecto_hlclock"
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
      {:ecto, "~> 2.2"},
      {:hlclock, "~> 0.1"},
      {:credo, "~> 0.5", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :ecto_hlclock,
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Neil Menne", "Chris Keathley"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/toniqsystems/ecto_hlclock"}
    ]
  end
end
