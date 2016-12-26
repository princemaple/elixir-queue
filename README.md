# Qex [![Hex.pm](https://img.shields.io/hexpm/v/qex.svg)](https://hex.pm/packages/qex) [![API Docs](https://img.shields.io/badge/api-docs-blue.svg?style=flat)](https://hexdocs.pm/qex/Qex.html)

A `:queue` wrapper with improvements in API and addition of Protocol implementations

## Protocols

`Inspect`, `Collectable` and `Enumerable` are implemented,
use Qex with `IO.inspect` and `Enum` functions!

## Installation

The package can be installed as:

  1. Add `qex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:qex, "~> 0.3"}]
    end
    ```

  2. Run `mix deps.get`
