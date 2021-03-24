defmodule Graphy.MixProject do
  use Mix.Project

  def project do
    [
      app: :graphy,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      default_release: :api,
      releases: releases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Graphy.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp releases do
    [
      api: [
        include_executables_for: [:unix],
        path: "release"
      ]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.5.8"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:absinthe, "~> 1.6"},
      {:absinthe_plug, "~> 1.5"},
      {:absinthe_phoenix, "~> 2.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.11", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
