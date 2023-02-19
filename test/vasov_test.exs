defmodule VasovTest do
  use ExUnit.Case

  doctest Vasov

  describe "transliterate/1 from bulgarian cyrillic into latin" do
    test "transliterate" do
      Enum.each(
        [
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
        ],
        fn {word, trans} ->
          assert_transliteration(trans, word)
        end
      )
    end

    test "when ия is in final position is transliterated with ia" do
      Enum.each(
        [
          {"Пияница", "Piyanitsa"},
          {"Катия", "Katia"},
          {"СофИя", "SofIa"},
          {"СофиЯ", "SofiA"},
          {"фият", "fiyat"},
          {"София-Град", "Sofia-Grad"}
        ],
        fn {word, trans} ->
          assert_transliteration(trans, word)
        end
      )
    end

    test "България is always transliterated in Bulgaria" do
      Enum.each(
        [
          {"българия", "bulgaria"},
          {"бУлГариЯ", "bUlGariA"},
          {"България-град", "Bulgaria-grad"},
          {"Българияград", "Bulgariyagrad"},
          {"Сбългария", "Sbalgaria"}
        ],
        fn {word, trans} ->
          assert_transliteration(trans, word)
        end
      )
    end

    test "do not transliterate unknown letters" do
      assert_transliteration("bulgaria", "bulgaria")
    end

    defp assert_transliteration(expected, original) do
      assert expected == Vasov.transliterate(original)
    end
  end
end
