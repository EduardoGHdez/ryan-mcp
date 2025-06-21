#!/usr/bin/env ruby

require 'bundler/setup'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb", "test/**/test_*.rb"]
end

desc "Run unit tests only"
task :test_unit do
  system('ruby -I lib:test test/unit/test_*.rb')
end

desc "Run integration tests only"
task :test_integration do
  system('ruby -I lib:test test/integration/test_*.rb')
end

desc "Build and install the gem globally"
task :install do
  puts "Building ryan gem..."
  system('gem build ryan.gemspec') or exit(1)

  puts "Installing ryan gem globally..."
  system('gem install ryan-1.0.0.gem') or exit(1)

  puts "✅ Ryan installed successfully! You can now run 'ryan' from anywhere."
end

desc "Uninstall the ryan gem"
task :uninstall do
  puts "Uninstalling ryan gem..."
  system('gem uninstall ryan -a')
  puts "✅ Ryan uninstalled successfully!"
end

desc "Reinstall the gem (uninstall then install)"
task :reinstall => [:uninstall, :install]

task default: :test
