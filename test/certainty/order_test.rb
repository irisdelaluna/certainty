# frozen_string_literal: true

require "test_helper"

module Certainty
  class OrderTest < TestCase
    def test_unknown_direction_error
      assert_raises Order::UnknownDirectionError, "unknown ordering: bogus" do
        Order.sorted? [], :bogus
      end
    end

    def test_unknown_direction_is_argument_error
      assert_kind_of ArgumentError, Order::UnknownDirectionError.new
    end

    def test_sorted_asc
      assert Order.sorted?([1, 2, 3], :asc, by: :itself)
    end

    def test_sorted_desc
      assert Order.sorted?(%i[b c a], :desc, by: :to_s)
    end

    def test_default_sort_by_itself
      assert Order.sorted?(%w[z y x], :desc)
    end

    def test_mixed_up
      refute Order.sorted?(%w[k f w], :asc)
      refute Order.sorted?([1, 2, 3], :desc)
    end

    def test_directions
      assert_equal 2, Order::DIRECTIONS.size
    end
  end
end
