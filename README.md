# Ryan 🤖

A simple MCP (Model Context Protocol) server that provides friendly greetings and tools.

## Installation

### Global Installation (Recommended)

Install Ryan as a global command so you can use it from anywhere:

```bash
# Clone and setup
git clone <your-repo-url>
cd ryan
./bin/setup

# Install globally using rake
rake install
```

Now you can run `ryan` from anywhere in your terminal! 🎉

### Manual Installation

If you prefer the manual approach:

```bash
gem build ryan.gemspec
gem install ryan-1.0.0.gem
```

## Quick Start

1. **Install Ryan globally** (see installation section above)

2. **Test it works:**
   ```bash
   ryan        # Starts the MCP server (Ctrl+C to stop)
   rake test   # Run tests (from project directory)
   ```

## Configure in Cursor

Add this to your Cursor MCP settings:

```json
{
  "mcpServers": {
    "ryan": {
      "command": "ryan"
    }
  }
}
```

Then ask Cursor: *"Hey Ryan, can you greet Alice?"*

## Available Tools

**hello_world** - Ryan greets someone by name with a personalized message.

## Development

### Managing Installation

- `rake install` - Build and install the gem globally
- `rake uninstall` - Remove the ryan gem 
- `rake reinstall` - Uninstall then install (perfect for development)

### Testing

- `rake test` - Run all tests
- `rake test_unit` - Run unit tests only
- `rake test_integration` - Run integration tests only 

### Adding New Tools

- Add new tools in `lib/ryan/tools/`
- Register them in `lib/ryan/server.rb`
- After making changes, run `rake reinstall` to update the global command

## Project Structure

```
ryan/
├── bin/ryan              # Executable entry point
├── lib/
│   ├── ryan.rb          # Main library file
│   └── ryan/
│       ├── server.rb    # MCP server implementation
│       ├── version.rb   # Version definition
│       └── tools/       # Tool implementations
├── test/                # Test suite
├── ryan.gemspec        # Gem specification
└── Rakefile            # Build and install tasks
```

## About MCP

The Model Context Protocol (MCP) enables AI assistants like Claude to connect with external tools and data sources. Ryan implements an MCP server that can be used with any MCP-compatible client.

That's it! 🚀
