# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # Checks if there is an empty line after example group blocks.
      #
      # @example
      #   # bad
      #   RSpec.describe Foo do
      #     describe '#bar' do
      #     end
      #     describe '#baz' do
      #     end
      #   end
      #
      #   # good
      #   RSpec.describe Foo do
      #     describe '#bar' do
      #     end
      #
      #     describe '#baz' do
      #     end
      #   end
      #
      class EmptyLineAfterExampleGroup < Cop
        extend AutoCorrector
        include RuboCop::RSpec::BlankLineSeparation

        MSG = 'Add an empty line after `%<example_group>s`.'

        def on_block(node)
          return unless example_group?(node)

          msg = format(MSG, example_group: node.method_name)
          check_missing_separating_lines(node, message: msg)
        end
      end
    end
  end
end
