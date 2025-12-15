# frozen_string_literal: true

require "test_helper"

module Certainty
  class OrderTest < TestCase
    def test_unknown_direction_error
      error = assert_raises Order::UnknownDirectionError do
        Order.sorted? [], :bogus
      end

      assert_equal error.message, "unknown direction: bogus"
    end

    def test_unknown_direction_is_argument_error
      assert_kind_of ArgumentError, Order::UnknownDirectionError.new(:bogus)
    end

    def test_not_applicable_error
      Order::DIRECTIONS.each do |order|
        2.times.each do |n|
          error = assert_raises Order::NotApplicableError do
            Order.sorted? n.times, order
          end

          expected_message = "not applicable when less than 2 elements, got: #{n}"
          assert_equal error.message, expected_message
        end
      end
    end

    def test_not_applicable_is_argument_error
      assert_kind_of ArgumentError, Order::NotApplicableError.new(0)
    end

    def test_sorted_asc
      assert Order.sorted?([1, 2, 3], :asc, by: :itself)
    end

    def test_sorted_desc
      assert Order.sorted?(%i[c b a], :desc, by: :to_s)
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

    include Order

    def test_assert
      sorted_list = [1, 2, 3]
      assert_order sorted_list, :asc, by: :itself
      assert_order sorted_list.reverse, :desc

      error = assert_raises Minitest::Assertion do
        assert_order sorted_list, :desc, by: :to_i
      end

      expected_message = "Expected [1, 2, 3] to be in descending order by `to_i'."
      assert_equal expected_message, error.message
    end

    def test_refute
      mixed_list = [3, 1, 2]
      refute_order mixed_list, :desc, by: :itself
      refute_order mixed_list, :asc

      error = assert_raises Minitest::Assertion do
        refute_order mixed_list.sort, :asc
      end

      expected_message = "Expected [1, 2, 3] not to be in ascending order by `itself'."
      assert_equal expected_message, error.message
    end
  end
end
