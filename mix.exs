defmodule Qex.Mixfile do
  use Mix.Project

  def project do
    [app: :qex,
     version: "0.4.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),

     description: description(),
     package: package()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    "A `:queue` wrapper with improvements in API and addition of Protocol implementations"
  end

  defp package do
    [licenses: ["MIT"],
     maintainers: ["Po Chen"],
     links: %{"GitHub": "https://github.com/princemaple/elixir-queue"}]
  end
end
