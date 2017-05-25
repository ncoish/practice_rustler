defmodule Monolith do
  @moduledoc """
  Documentation for Monolith.
  """

  use Rustler, otp_app: :monolith, crate: :monolith


  def add(_arg1, _arg2), do: exit(:nif_not_loaded)

end
