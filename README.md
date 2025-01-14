# Vasov

![Elixir CI](https://github.com/Efesto/vasov/workflows/Elixir%20CI/badge.svg)
[![Hex pm](https://img.shields.io/hexpm/v/vasov.svg?style=flat)](https://hex.pm/packages/vasov)
[![Hexdocs.pm](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/vasov/)

<!-- MDOC !-->

Vasov implements text transliteration from bulgarian cyrillic to latin according to the [streamlined system](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1105090/ROMANIZATION_OF_BULGARIAN_with_examples.pdf) officially adopted in Bulgaria.

The name is an homage to [Ivan Vazov (Иван Вазов)](https://en.wikipedia.org/wiki/Ivan_Vazov).

## Installation

The package can be installed by adding `vasov` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:vasov, "~> 1.0.0"}
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
