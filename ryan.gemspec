require_relative 'lib/ryan/version'

Gem::Specification.new do |spec|
  spec.name          = 'ryan'
  spec.version       = Ryan::VERSION
  spec.authors       = ['Your Name']
  spec.email         = ['your.email@example.com']

  spec.summary       = 'Ryan MCP Server'
  spec.description   = 'A Model Context Protocol (MCP) server providing various tools'
  spec.homepage      = 'https://github.com/yourusername/ryan'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.7.0'

  # Specify which files should be added to the gem when it is released
  spec.files = Dir.glob([
    'lib/**/*',
    'bin/*',
    'Gemfile',
    'Rakefile',
    'README.md'
  ]).select { |f| File.file?(f) }

  # Specify the executable files
  spec.bindir        = 'bin'
  spec.executables   = ['ryan']

  # Dependencies
  spec.add_dependency 'mcp'

  # Development dependencies
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end
