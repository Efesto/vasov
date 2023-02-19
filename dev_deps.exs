defmodule DevDeps do
  @moduledoc """
  Development and testing dependencies
  """
  def deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false}
    ]
  end

  def phoenix_deps do
    [
      {:sobelow, "~> 0.11", only: [:dev, :test], runtime: false}
    ]
  end
end
