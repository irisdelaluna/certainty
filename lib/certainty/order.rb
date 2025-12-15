# frozen_string_literal: true

module Certainty
  # The collection ordering checks.
  module Order
    # Possible sorts.
    DIRECTIONS = %i[asc desc].freeze

    # Indicates neither of known `DIRECTIONS`.
    class UnknownDirectionError < ArgumentError
      def initialize(order)
        super("unknown direction: #{order}")
      end
    end

    # Raised when list is empty or has just one element.
    # Such lists have no verifiable order.
    class NotApplicableError < ArgumentError
      def initialize(size)
        super("not applicable when less than 2 elements, got: #{size}")
      end
    end

    # Check whether given `list` is in the specified `order`,
    # and if sorted `by` given attribute.
    #
    # Applicable only to lists of more than one element.
    def self.sorted?(list, order, by: :itself)
      raise UnknownDirectionError, order unless DIRECTIONS.include?(order)
      raise NotApplicableError, list.size if list.size < 2

      expected_cmp = order == :desc ? 1 : -1

      list.each_cons(2).all? do |x, y|
        a, b = [x, y].map { _1.public_send by.to_sym }
        cmp = a <=> b
        cmp.zero? || cmp == expected_cmp
      end
    end

    # Assert sort `order` of the given `list` achieved `by` comparison
    # of that specific attribute.
    #
    # Basically, is this `list` sorted `by` attribute in `order`?
    def assert_order(list, order, by: :itself)
      assert Order.sorted?(list, order, by:),
        "Expected #{list.inspect} to be in #{order}ending order by `#{by}'."
    end

    # Assert any other but such sort `order` of the given `list`
    # achieved `by` comparison of that specific attribute.
    #
    # Basically, is this `list` mixed up or sorted reverse to `order`?
    def refute_order(list, order, by: :itself)
      refute Order.sorted?(list, order, by:),
        "Expected #{list.inspect} not to be in #{order}ending order by `#{by}'."
    end
  end
end
