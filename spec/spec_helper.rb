# frozen_string_literal: true

require 'simplecov'
if ENV['CI'] || ENV['ENABLED_COVERAGE']
  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/vendor/'
  end
end
if ENV['CI']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'bundler/setup'
require 'oura'
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = 'spec/.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
