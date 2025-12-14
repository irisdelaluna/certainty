# frozen_string_literal: true

module Certainty
  # The collection ordering checks.
  module Order
    # Possible sorts.
    DIRECTIONS = %i[asc desc].freeze

    # Indicates neither of known `DIRECTIONS`.
    class UnknownDirectionError < ArgumentError
    end

    # Check whether given `list` is in the specified `order`,
    # and if sorted `by` given attribute.
    def self.sorted?(list, order, by: :itself)
      # TODO: Implement
    end
  end
end
