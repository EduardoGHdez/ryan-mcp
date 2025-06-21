require 'mcp'
require 'mcp/transports/stdio'
require_relative 'version'
require_relative 'tools/hello_world'

module Ryan
  class Server
    def self.start
      # Set up Ryan's MCP server
      server = MCP::Server.new(
        name: "Ryan",
        version: Ryan::VERSION,
        tools: [Ryan::Tools::HelloWorld]
      )

      transport = MCP::Transports::StdioTransport.new(server)
      transport.open
    end
  end
end
