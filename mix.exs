defmodule Qex.Mixfile do
  use Mix.Project

  @source_url "https://github.com/princemaple/elixir-queue"
  @version "0.5.0"

  def project do
    [
      app: :qex,
      version: @version,
      elixir: "~> 1.9",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: description(),
      package: package(),

      # Docs
      name: "Qex",
      source_url: @source_url,
      homepage_url: @source_url,
      docs: docs()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    "A `:queue` wrapper with improvements in API and addition of Protocol implementations"
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Po Chen"],
      links: %{GitHub: "https://github.com/princemaple/elixir-queue"}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "Qex",
      canonical: "http://hexdocs.pm/qex",
      source_url: @source_url,
      extras: ["CHANGELOG.md"]
    ]
  end
end
