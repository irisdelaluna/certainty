# frozen_string_literal: true

require "config"

class CertaintyTest < Test
  def test_version_presence
    refute_nil ::Certainty::VERSION
  end
end
