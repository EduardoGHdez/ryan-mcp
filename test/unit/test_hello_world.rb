require_relative '../test_helper'

class TestHelloWorld < Minitest::Test
  def test_hello_world_tool_exists
    assert_equal MCP::Tool, Ryan::Tools::HelloWorld.superclass
  end

  def test_hello_world_call
    response = Ryan::Tools::HelloWorld.call(name: "Alice", server_context: nil)

    assert_instance_of MCP::Tool::Response, response
    assert_equal 1, response.content.length
    assert_equal "text", response.content.first[:type]
    assert_includes response.content.first[:text], "Alice"
    assert_includes response.content.first[:text], "Ryan speaking"
  end

  def test_hello_world_with_different_names
    %w[Bob Charlie Diana].each do |name|
      response = Ryan::Tools::HelloWorld.call(name: name, server_context: nil)
      assert_includes response.content.first[:text], name
    end
  end
end
