# frozen_string_literal: true

# NOTE: Perform tests automatically.

%w[autorun benchmark reporters].each do |mod|
  require "minitest/#{mod}"
end

# NOTE: Convenience aliases.

# See `Minitest::Test`.
class Test < Minitest::Test
end

# See `Minitest::Benchmark`
class Benchmark < Minitest::Benchmark
end

# NOTE: The intention is `test/config.rb` brevity.

# See `Minitest::Reporters`
Reporters = Minitest::Reporters

include Reporters # rubocop:disable Style/MixinUsage

# NOTE: Test reporting defaults...

Reporters.use! [SpecReporter.new(color: true)]
