defmodule Vasov do
  @moduledoc """
  Transliterates from bulgarian cyrillic to roman latin and reverse

  The [streamlined system](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1105090/ROMANIZATION_OF_BULGARIAN_with_examples.pdf) is implemented
  """
  @bg_to_latin %{
    "Р" => "R",
    "з" => "z",
    "Т" => "T",
    "Ш" => "Sh",
    "т" => "t",
    "А" => "A",
    "ч" => "ch",
    "р" => "r",
    "И" => "I",
    "Ь" => "Y",
    "м" => "m",
    "ц" => "ts",
    "Е" => "E",
    "щ" => "sht",
    "У" => "U",
    "Л" => "L",
    "Ч" => "Ch",
    "н" => "n",
    "Й" => "Y",
    "Ж" => "Zh",
    "о" => "o",
    "Ю" => "Yu",
    "ь" => "y",
    "Б" => "B",
    "х" => "h",
    "г" => "g",
    "ш" => "sh",
    "л" => "l",
    "Ц" => "Ts",
    "П" => "P",
    "в" => "v",
    "К" => "K",
    "с" => "s",
    "ъ" => "a",
    "С" => "S",
    "ж" => "zh",
    "ф" => "f",
    "д" => "d",
    "Х" => "H",
    "а" => "a",
    "б" => "b",
    "Я" => "Ya",
    "М" => "M",
    "й" => "y",
    "у" => "u",
    "п" => "p",
    "Г" => "G",
    "О" => "O",
    "ю" => "yu",
    "е" => "e",
    "к" => "k",
    "Н" => "N",
    "я" => "ya",
    "В" => "V",
    "Ъ" => "A",
    "Ф" => "F",
    "и" => "i",
    "З" => "Z",
    "Д" => "D",
    "Щ" => "Sht"
  }

  @latin_to_bg %{
    "k" => "к",
    "zh" => "ж",
    "G" => "Г",
    "Ts" => "Ц",
    "D" => "Д",
    "K" => "К",
    "F" => "Ф",
    "i" => "и",
    "v" => "в",
    "g" => "г",
    "ts" => "ц",
    "e" => "е",
    "T" => "Т",
    "Y" => "Ь",
    "V" => "В",
    "l" => "л",
    "U" => "У",
    "B" => "Б",
    "ch" => "ч",
    "z" => "з",
    "a" => "ъ",
    "p" => "п",
    "Ya" => "Я",
    "Zh" => "Ж",
    "f" => "ф",
    "ya" => "я",
    "h" => "х",
    "r" => "р",
    "L" => "Л",
    "S" => "С",
    "yu" => "ю",
    "O" => "О",
    "R" => "Р",
    "o" => "о",
    "H" => "Х",
    "E" => "Е",
    "Sht" => "Щ",
    "u" => "у",
    "s" => "с",
    "n" => "н",
    "b" => "б",
    "Z" => "З",
    "Sh" => "Ш",
    "Yu" => "Ю",
    "N" => "Н",
    "A" => "А",
    "y" => "ь",
    "Ch" => "Ч",
    "M" => "М",
    "t" => "т",
    "m" => "м",
    "I" => "И",
    "P" => "П",
    "sht" => "щ",
    "sh" => "ш",
    "d" => "д"
  }

  @doc """
  Transliterates a text from bulgarian cyrillic language to roman latin

  Usage:
  ```
  iex> Vasov.transliterate_to_latin("Бургас")
  "Burgas"
  iex> Vasov.transliterate_to_latin("София")
  "Sofia"
  iex> Vasov.transliterate_to_latin("България")
  "Bulgaria"
  ```
  """
  def transliterate_to_latin(text) do
    text
    |> normalize()
    |> String.graphemes()
    |> Enum.reduce("", fn
      original, acc -> acc <> Map.get(@bg_to_latin, original, original)
    end)
  end

  @doc """
  Transliterates a text from roman latin to bulgarian cyrillic

  Usage:
  ```
  iex> Vasov.transliterate_to_cyrillic("Burgas")
  "Бургас"
  iex> Vasov.transliterate_to_cyrillic("Sofia")
  "София"
  iex> Vasov.transliterate_to_cyrillic("Bulgaria")
  "България"
  ```
  """
  def transliterate_to_cyrillic(text) do
    dbg()

    fancy_regex()
    |> Regex.named_captures(text)
    |> IO.inspect()
  end

  defp fancy_regex() do
    @latin_to_bg
    |> Enum.map_join(
      "|",
      fn {latin, _cyrillic} ->
        "(?<#{latin}>#{latin})"
      end
    )
    |> Regex.compile()
  end

  defp normalize(text) do
    text
    |> normalize_state_name()
    |> normalize_final_ya()
  end

  defp normalize_state_name(text) do
    Regex.replace(~r/^(б)(ъ)(лгария)/ui, text, fn _word, token_1, ua_token, token_2 ->
      replacement =
        case ua_token do
          "ъ" -> "у"
          "Ъ" -> "У"
        end

      token_1 <> replacement <> token_2
    end)
  end

  defp normalize_final_ya(text) do
    Regex.replace(~r/^(.+и)(я)\b/ui, text, fn _word, word, ending ->
      replacement =
        case ending do
          "я" -> "а"
          "Я" -> "А"
        end

      word <> replacement
    end)
  end
end
