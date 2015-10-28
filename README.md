# Spanish

In order to learn Elixir, I'm writing a Spanish orthography to IPA translator.
This is based on a similar library I once wrote in Ruby.

This is basically baby's first Elixir project. Don't use this for anything
because I don't really know what I'm doing yet.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add spanish to your list of dependencies in `mix.exs`:

        def deps do
          [{:spanish, "~> 0.0.1"}]
        end

  2. Ensure spanish is started before your application:

        def application do
          [applications: [:spanish]]
        end
