# Qex [![Hex.pm](https://img.shields.io/hexpm/v/qex.svg)](https://hex.pm/packages/qex) [![API Docs](https://img.shields.io/badge/api-docs-blue.svg?style=flat)](https://hexdocs.pm/qex/Qex.html)

A minimal FIFO queue implementation for Elixir

A primitive queue data structure that doesn't spawn a separate process

## Protocols

`Inspect` and `Enumerable` are implemented, use queues with `Enum`!

## Installation

The package can be installed as:

  1. Add `qex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:qex, "~> 0.1.0"}]
    end
    ```

  2. Run `mix deps.get`
