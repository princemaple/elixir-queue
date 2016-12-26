# Qex [![Hex.pm](https://img.shields.io/hexpm/v/qex.svg)](https://hex.pm/packages/qex)

A minimal FIFO queue implementation for Elixir

A primitive queue data structure that doesn't spawn a separate process

## Protocols

`Inspect` and `Enumerable` are implemented, use queues with `Enum`!

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `qex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:qex, "~> 0.1.0"}]
    end
    ```

