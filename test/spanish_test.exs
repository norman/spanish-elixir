defmodule SpanishTest do
  use ExUnit.Case
  import Spanish
  doctest Spanish

  test "c as s or k" do
    assert "kasa" == ipa("casa")
    assert "biθi" == ipa("bici")
    assert "fɾanko" == ipa("franco")
  end

  test "x" do
    assert "eksamen" == ipa("examen")
  end

  test "g" do
    assert "ɡustaβo" == ipa("gustavo")
    assert "laɣo" == ipa("lago")
    assert "ximena" == ipa("gimena")
    assert "xeɾman" == ipa("germán")
  end

  test "sprirantization" do
    assert "alɣo" == ipa("algo")
    assert "ranɡo" == ipa("rango")
    assert "kaldo" == ipa("caldo")
    assert "kandaðo" == ipa("candado")
  end

  test "y" do
    assert "i" == ipa("y")
    assert "kaʝo" == ipa("cayó")
    assert "iɣwaθu" == ipa("yguazú")
    assert "doj" == ipa("doy")
    assert "ʝeɾβa" == ipa("yerba")
  end

  # test "voicing" do
  #   assert "rasɣo" == ipa("rasgo")
  #   assert "xaθmin" == ipa("jazmín")
  # end

  test "trilled r and flap r" do
    assert "ropa" == ipa("ropa")
    assert "foɾo" == ipa("foro")
    assert "foraɾ" == ipa("forrar")
  end

  test "q, g and u" do
    assert "ke" == ipa("que")
    assert "ɡwemes" == ipa("güemes")
    assert "ɡera" == ipa("guerra")
    assert "ɡiɲo" == ipa("guiño")
    assert "pinɡwino" == ipa("pingüino")
  end

  test "word-initial ps" do
    assert "sikoloxia" == ipa("psicología")
  end
  #
  # test "x archaism" do
  #   assert "mexiko" == ipa("México")
  #   assert "eksmexikano" == ipa("exmexicano")
  #   assert "kixote" == ipa("Quixote")
  #   assert "kixotesko" == ipa("quixotesco")
  # end
  #
  test "diphthongs" do
    assert "buo" == ipa("buho")
    assert "pua" == ipa("púa")
    assert "oeste" = ipa("oeste")
  end

end
