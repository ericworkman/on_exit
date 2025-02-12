defmodule OtherTest do
  use ExUnit.Case, async: true

  @env_name "TEST_VAR"

  test "sees the initial value" do
    :timer.sleep(50)
    assert "foo" == System.get_env(@env_name)
  end

  test "sees the initial value again" do
    :timer.sleep(100)
    assert "foo" == System.get_env(@env_name)
  end
end
