# Vasov

![Elixir CI](https://github.com/Efesto/vasov/workflows/Elixir%20CI/badge.svg)
[![Hex pm](https://img.shields.io/hexpm/v/vasov.svg?style=flat)](https://hex.pm/packages/vasov)
[![Hexdocs.pm](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/vasov/)

Transliterates from bulgarian cyrillic to latin.

The name is an homage to [Ivan Vazov (Иван Вазов)](https://en.wikipedia.org/wiki/Ivan_Vazov).

## Installation

The package can be installed by adding `vasov` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:vasov, "~> 0.1.0"}
  ]
end
```

## Usage

```Elixir
iex> Vasov.transliterate_to_latin("Бургас")
"Burgas"
iex> Vasov.transliterate_to_latin("София")
"Sofia"
iex> Vasov.transliterate_to_latin("България")
"Bulgaria"
```
