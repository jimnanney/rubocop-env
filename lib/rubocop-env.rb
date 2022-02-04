# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/env'
require_relative 'rubocop/env/version'
require_relative 'rubocop/env/inject'

RuboCop::Env::Inject.defaults!

require_relative 'rubocop/cop/env_cops'
