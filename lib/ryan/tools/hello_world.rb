require 'mcp'

module Ryan
  module Tools
    class HelloWorld < MCP::Tool
      description "Ryan says hello to someone with a personalized greeting"

      input_schema(
        properties: {
          name: {
            type: "string",
            description: "The name of the person Ryan should greet"
          },
        },
        required: ["name"]
      )

      def self.call(name:, server_context:)
        MCP::Tool::Response.new([{
          type: "text",
          text: "Hello world, #{name}! This is Ryan speaking. 👋"
        }])
      end
    end
  end
end
