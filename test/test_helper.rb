# frozen_string_literal: true

require "certainty"

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(color: true)]

class TestCase < Minitest::Test
end
