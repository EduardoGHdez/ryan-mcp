require_relative '../test_helper'
require 'json'
require 'open3'

class TestServerIntegration < Minitest::Test
  def test_server_mcp_protocol
    # Test messages following MCP protocol
    initialize_msg = {
      jsonrpc: "2.0",
      id: 1,
      method: "initialize",
      params: {
        protocolVersion: "2024-11-05",
        capabilities: {},
        clientInfo: {
          name: "test-client",
          version: "1.0.0"
        }
      }
    }

    list_tools_msg = {
      jsonrpc: "2.0",
      id: 2,
      method: "tools/list"
    }

    call_tool_msg = {
      jsonrpc: "2.0",
      id: 3,
      method: "tools/call",
      params: {
        name: "hello_world",
        arguments: {
          name: "Test User"
        }
      }
    }

    # Run Ryan and send test messages
    Open3.popen3("./bin/ryan") do |stdin, stdout, stderr, wait_thread|
      # Test initialize request
      stdin.puts(initialize_msg.to_json)
      stdin.flush

      raw_response = stdout.gets
      refute_nil raw_response, "Server should respond to initialize"

      response = JSON.parse(raw_response.strip)
      assert_equal "Ryan", response.dig('result', 'serverInfo', 'name')
      assert_equal Ryan::VERSION, response.dig('result', 'serverInfo', 'version')

      # Test list tools request
      stdin.puts(list_tools_msg.to_json)
      stdin.flush

      raw_response = stdout.gets
      response = JSON.parse(raw_response.strip)
      tools = response.dig('result', 'tools') || []
      refute_empty tools, "Server should have tools"
      assert_includes tools.map { |t| t['name'] }, 'hello_world'

      # Test tool call request
      stdin.puts(call_tool_msg.to_json)
      stdin.flush

      raw_response = stdout.gets
      refute_nil raw_response, "Server should respond to tool call"
      response = JSON.parse(raw_response.strip)

      # Check if there's an error in the response
      if response['error']
        flunk "Server returned error: #{response['error']}"
      end

      content = response.dig('result', 'content', 0, 'text')
      refute_nil content, "Server should return content. Got response: #{response.inspect}"
      assert_includes content, "Test User"
      assert_includes content, "Ryan speaking"

      stdin.close
    end
  end
end
