# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oura/version'

Gem::Specification.new do |spec|
  spec.name          = 'oura'
  spec.version       = Oura::VERSION
  spec.authors       = ['Ryota Ikezawa']
  spec.email         = ['pavegy@gmail.com']

  spec.summary       = 'unofficial API client of oura-cloud.'
  spec.description   = 'unofficial API client of oura-cloud for ruby.'
  spec.homepage      = 'https://github.com/paveg/oura'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5'
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'oauth2'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'danger'
  spec.add_development_dependency 'danger-junit'
  spec.add_development_dependency 'danger-rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
end
