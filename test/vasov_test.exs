defmodule VasovTest do
  use ExUnit.Case

  doctest Vasov

  @simple_cases [
    {"основните", "osnovnite"},
    {"Асеновград", "Asenovgrad"},
    {"Враца", "Vratsa"},
    {"Габрово", "Gabrovo"},
    {"Добрич", "Dobrich"},
    {"Елхово", "Elhovo"},
    {"Кърджали", "Kardzhali"},
    {"Златица", "Zlatitsa"},
    {"Исперих", "Isperih"},
    {"Айтос", "Aytos"},
    {"Казанлък", "Kazanlak"},
    {"Ловеч", "Lovech"},
    {"Монтана", "Montana"},
    {"Никопол", "Nikopol"},
    {"Омуртаг", "Omurtag"},
    {"Пловдив", "Plovdiv"},
    {"Разград", "Razgrad"},
    {"Твърдица", "Tvarditsa"},
    {"Угърчин", "Ugarchin"},
    {"Хасково", "Haskovo"},
    {"Царево", "Tsarevo"},
    {"Чирпан", "Chirpan"},
    {"Шумен", "Shumen"},
    {"Търговище", "Targovishte"},
    {"Гълъбово", "Galabovo"},
    {"каньон", "kanyon"},
    {"Кюстендил", "Kyustendil"},
    {"Ямбол", "Yambol"},
    {"мира", "mira"},
    {"Софиа е ного красива", "Sofia e nogo krasiva"},
    {"Аз обичам лутеница", "Az obicham lutenitsa"},
    {"Ти си чувек", "Ti si chuvek"},
    {"хелло Маик, хелло Джое", "hello Maik, hello Dzhoe"}
  ]

  @final_ia_cases [
    {"Пияница", "Piyanitsa"},
    {"Катия", "Katia"},
    {"СофИя", "SofIa"},
    {"СофиЯ", "SofiA"},
    {"фият", "fiyat"},
    {"София-Град", "Sofia-Grad"}
  ]

  @state_name_cases [
    {"българия", "bulgaria"},
    {"бУлГариЯ", "bUlGariA"},
    {"България-град", "Bulgaria-grad"},
    {"Българияград", "Bulgariyagrad"},
    {"Сбългария", "Sbalgaria"}
  ]

  describe "transliterate_to_latin/1" do
    test "transliterates from bulgarian cyrillic to latin" do
      Enum.each(@simple_cases, fn {word, trans} ->
        assert_transliteration(trans, word)
      end)
    end

    test "when ия is in final position is transliterated with ia" do
      Enum.each(@final_ia_cases, fn {word, trans} ->
        assert_transliteration(trans, word)
      end)
    end

    test "България is always transliterated in Bulgaria" do
      Enum.each(
        @state_name_cases,
        fn {word, trans} ->
          assert_transliteration(trans, word)
        end
      )
    end

    test "does not transliterate latin letters" do
      assert_transliteration("bulgaria", "bulgaria")
    end

    defp assert_transliteration(expected, original) do
      assert expected == Vasov.transliterate_to_latin(original)
    end
  end

  describe "transliterate_to_cyrillic/1" do
    test "transliterates from latin to bulgarian cyrillic" do
      Enum.each(@simple_cases, fn {cyrillic, latin} ->
        assert_transliteration(cyrillic, latin)
      end)
    end

    defp assert_transliteration(expected, original) do
      assert expected == Vasov.transliterate_to_cyrillic(original)
    end
  end
end
