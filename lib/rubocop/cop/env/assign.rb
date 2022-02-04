# frozen_string_literal: true
require 'pry'

module RuboCop
  module Cop
    module Env
      # Checks for any assignments to the ENV in tests.
      #
      # When assigning to ENV you assign to a global state. This can affect other tests when you
      # do not reassign the original value back to the ENV. This also can affect other tests when
      # you are running tests in separate threads. This can lead to flaky and hard to find bugs in
      # your test suite. It is much safer to mock the return value of the index getter to return
      # the correct value.
      #
      # @example
      #   # bad
      #   ENV["OPTS"] = "testopts"
      #
      #   # good
      #   allow(ENV).to receive(:[]).and_call_original
      #   allow(ENV).to receive(:[]).with("OPTS").and_return("testopts")
      #
      class Assign < Base
        MSG = 'Mock the return value of an ENV variable instead of assigning to ENV directly.'

        def_node_matcher :env_assign?, <<~PATTERN
          (send (const nil? :ENV) :[]= ...)
        PATTERN

        def on_send(node)
          return unless env_assign?(node)

          add_offense(node)
        end
      end
    end
  end
end
