defmodule Monolith.Mixfile do
  use Mix.Project

  def project do
    [app: :monolith,
     version: "0.1.0",
     elixir: "~> 1.4",
     compilers: [:rustler] ++ Mix.compilers(),
     rustler_crates: rustler_crates(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp rustler_crates do
    [monolith: [
      path: "native/monolith",
      mode: (if Mix.env == :prod, do: :release, else: :debug),
    ]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:rustler, github: "hansihe/rustler", sparse: "rustler_mix", branch: "master"}]
  end
end
