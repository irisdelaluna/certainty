# frozen_string_literal: true

module Certainty
  # The collection ordering checks.
  module Order
    # Possible sorts.
    DIRECTIONS = %i[asc desc].freeze

    # Indicates neither of known `DIRECTIONS`.
    class UnknownDirectionError < ArgumentError
      def initialize(order)
        super("Unknown direction: #{order}")
      end
    end

    # Check whether given `list` is in the specified `order`,
    # and if sorted `by` given attribute.
    def self.sorted?(list, order, by: :itself)
      raise UnknownDirectionError, order unless DIRECTIONS.include?(order)

      expected_cmp = order == :desc ? 1 : -1

      list.each_cons(2).all? do |x, y|
        a, b = [x, y].map { _1.public_send by.to_sym }
        cmp = a <=> b and cmp.zero? and next true
        cmp == expected_cmp
      end
    end
  end
end
