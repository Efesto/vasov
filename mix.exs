defmodule Vasov.MixProject do
  use Mix.Project

  def project do
    [
      app: :vasov,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs do
    [
      main: "Vasov",
      source_ref: "master",
      source_url: "https://github.com/Efesto/vasov",
      extras: ["README.md"]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:mix_test_interactive, "~> 1.0", only: :dev, runtime: false}
    ]
  end
end
