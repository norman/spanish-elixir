defmodule Spanish do
  import Enum

  @vowels ["a", "e", "i", "o", "u", "á", "é", "í", "ó", "ú", "ü"]
  @vocoids ["l", "r", "ɾ"] ++ @vowels

  def ipa(string) do
    [head | tail] = String.codepoints(string)
    _ipa(head, tail, [])
  end

  def sound(a, b, c), do: _sound(a, b, c)

  def _sound("a", _, _), do: "a"
  def _sound("á", _, _), do: "a"
  def _sound("b", prev, next) when prev in @vocoids and next in @vowels, do: "β"
  def _sound("b", _, _), do: "b"
  def _sound("c", _, next) when next in ["i", "e"], do: "θ"
  def _sound("c", _, "h"), do: "t͡ʃ"
  def _sound("c", _, _), do: "k"
  def _sound("d", prev, next) when prev in @vowels and next in @vowels, do: "ð"
  def _sound("d", _, _), do: "d"
  def _sound("e", _, _), do: "e"
  def _sound("f", _, _), do: "f"
  def _sound("g", prev, next) when prev in @vocoids and next in ["a", "o", "u"], do: "ɣ"
  def _sound("g", _, next) when next in ["i", "e", "í", "é"], do: "x"
  def _sound("g", _, _), do: "ɡ"
  def _sound("h", _, _), do: ""
  def _sound("i", _, "e"), do: "j"
  def _sound("í", _, _), do: "i"
  def _sound("i", _, _), do: "i"
  def _sound("j", _, _), do: "x"
  def _sound("k", _, _), do: "k"
  def _sound("l", "ʎ", _), do: ""
  def _sound("l", _, "l"), do: "ʎ"
  def _sound("l", _, _), do: "l"
  def _sound("m", _, _), do: "m"
  def _sound("n", _, _), do: "n"
  def _sound("ñ", _, _), do: "ɲ"
  def _sound("o", _, _), do: "o"
  def _sound("ó", _, _), do: "o"
  def _sound("p", "", "s"), do: ""
  def _sound("p", _, _), do: "p"
  def _sound("q", _, _), do: "k"
  def _sound("r", "", _), do: "r"
  def _sound("r", _, "r"), do: "r"
  def _sound("r", "r", _), do: ""
  def _sound("r", _, _), do: "ɾ"
  def _sound("s", _, _), do: "s"
  def _sound("t", _, _), do: "t"
  def _sound("u", "ɡ", next) when next in ["i", "e", "í", "é"], do: ""
  def _sound("u", "k", next) when next in ["i", "e", "í", "é"], do: ""
  def _sound("u", _, next) when next in ["a", "e", "i", "o"], do: "w"
  def _sound("u", _, _), do: "u"
  def _sound("ú", _, _), do: "u"
  def _sound("ü", _, _), do: "w"
  def _sound("v", prev, next) when prev in @vocoids and next in @vowels, do: "β"
  def _sound("v", _, _), do: "b"
  def _sound("x", _, _), do: "ks"
  def _sound("y", prev, next) when prev != "" and next == "", do: "j"
  def _sound("y", prev, next) when prev == "" and next in @vowels, do: "ʝ"
  def _sound("y", prev, _) when prev in @vowels, do: "ʝ"
  def _sound("y", _, _), do: "i"
  def _sound("z", _, _), do: "θ"

  defp _ipa(a, [], []) do
    _sound(a, "", "")
  end

  defp _ipa(a, b, []) do
    [head | tail] = b
    _ipa(head, tail, [_sound(a, "", hd(b))])
  end

  defp _ipa(a, [], accum) do
    reverse([_sound(a, hd(accum), "")] ++ accum) |> List.to_string
  end

  defp _ipa(a, b, accum) do
    [head | tail] = b
    _ipa(head, tail, [_sound(a, hd(accum), hd(b))] ++ accum)
  end
end
