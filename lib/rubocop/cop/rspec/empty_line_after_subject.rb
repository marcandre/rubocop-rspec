# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # Checks if there is an empty line after subject block.
      #
      # @example
      #   # bad
      #   subject(:obj) { described_class }
      #   let(:foo) { bar }
      #
      #   # good
      #   subject(:obj) { described_class }
      #
      #   let(:foo) { bar }
      class EmptyLineAfterSubject < Cop
        extend AutoCorrector
        include RuboCop::RSpec::BlankLineSeparation

        MSG = 'Add empty line after `subject`.'

        def on_block(node)
          return unless subject?(node) && !in_spec_block?(node)

          check_missing_separating_lines(node, message: MSG)
        end

        private

        def in_spec_block?(node)
          node.each_ancestor(:block).any? do |ancestor|
            Examples::ALL.include?(ancestor.method_name)
          end
        end
      end
    end
  end
end
