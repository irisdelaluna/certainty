# frozen_string_literal: true

require "simplecov"

SimpleCov.start do
  enable_coverage :branch
  add_filter "/test/"
end

require "certainty"

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(color: true)]

class TestCase < Minitest::Test
end

if ENV["BENCH"]
  require "minitest/benchmark"

  class PerformanceTest < Minitest::Benchmark
  end
else
  class PerformanceTest # rubocop:disable Lint/EmptyClass
  end
end
