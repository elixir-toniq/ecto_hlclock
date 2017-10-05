defmodule EctoHlclock.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_hlclock,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto, "~> 2.2"},
      {:hlclock, "~> 0.1"},
      {:credo, "~> 0.5", only: [:dev, :test]},
      {:dogma, "~> 0.1", only: [:dev]},
    ]
  end
end
