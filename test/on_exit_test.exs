defmodule OnExitTest do
  use ExUnit.Case, async: true

  @env_name "TEST_VAR"

  test "sees the initial value" do
    assert "foo" == System.get_env(@env_name)
  end

  test "sees a temporary value" do
    setup_env("bar")
    :timer.sleep(100)
    assert "bar" == System.get_env(@env_name)
  end

  test "sees the initial value again" do
    assert "foo" == System.get_env(@env_name)
  end

  defp setup_env(variable) do
    previous_env = System.get_env(@env_name)

    on_exit(fn ->
      IO.inspect("resetting the env var")
      :timer.sleep(500)
      System.put_env(@env_name, previous_env)
    end)

    System.put_env(@env_name, variable)
  end
end
