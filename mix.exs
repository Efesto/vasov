defmodule Vasov.MixProject do
  use Mix.Project

  @source_url "https://github.com/Efesto/vasov"
  @version "0.1.0"

  def project do
    [
      app: :vasov,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      description: description()
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
      source_ref: "v#{@version}",
      source_url: @source_url,
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

  defp description do
    "Transliterates from bulgarian cyrillic to latin."
  end

  defp package() do
    [
      name: "vasov",
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end
end
