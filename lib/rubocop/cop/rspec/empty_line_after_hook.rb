# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # Checks if there is an empty line after hook blocks.
      #
      # @example
      #   # bad
      #   before { do_something }
      #   it { does_something }
      #
      #   # bad
      #   after { do_something }
      #   it { does_something }
      #
      #   # bad
      #   around { |test| test.run }
      #   it { does_something }
      #
      #   # good
      #   before { do_something }
      #
      #   it { does_something }
      #
      #   # good
      #   after { do_something }
      #
      #   it { does_something }
      #
      #   # good
      #   around { |test| test.run }
      #
      #   it { does_something }
      #
      class EmptyLineAfterHook < Cop
        extend AutoCorrector
        include RuboCop::RSpec::BlankLineSeparation

        MSG = 'Add an empty line after `%<hook>s`.'

        def on_block(node)
          return unless hook?(node)

          msg = format(MSG, hook: node.method_name)
          check_missing_separating_lines(node, message: msg)
        end
      end
    end
  end
end
