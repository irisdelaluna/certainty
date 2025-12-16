# frozen_string_literal: true

require "config"

module Certainty
  class OrderBenchmark < Benchmark
    def self.bench_range
      bench_linear(2, 7_000, 1_000)
    end

    def bench_mixed
      samples = make_samples

      # Constant because of the predicate returning early, just as soon
      # as a sort inconsistency is found.
      assert_performance_constant do
        Order.sorted?(samples.shift, :desc)
      end
    end

    def bench_sorted
      samples = make_samples.each(&:sort!)

      # Linear due to looping over the entire list when sorted.
      assert_performance_linear 0.5 do
        Order.sorted?(samples.shift, :asc)
      end
    end

    private

    def make_samples
      self.class.bench_range.map do |sample_size|
        sample_size.times.map { rand((_1 + 1) * 100) }
      end
    end
  end
end
