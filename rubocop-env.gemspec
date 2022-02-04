# frozen_string_literal: true

require_relative 'lib/rubocop/env/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-env'
  spec.version       = RuboCop::Env::VERSION
  spec.authors       = ['Jim Nanney']
  spec.email         = ['jnanney@gmail.com']

  spec.summary       = 'Rubocop Cop to prevent assignment to ENV in rspec tests'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/jimnanney/rubocop-env'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5'

  spec.metadata['allowed_push_host'] = 'https://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_runtime_dependency 'rubocop'
  spec.add_development_dependency 'pry'
end
