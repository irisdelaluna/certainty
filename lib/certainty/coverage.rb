# Test coverage configuration (for `SimpleCov.start`).
# Can be defined in `test/config.rb` before requiring `certainty` lib.
COVERAGE = lambda do |*|
end unless defined? COVERAGE

if ARGV.include?("--coverage")
  require "simplecov"

  SimpleCov.start do
    enable_coverage :branch
    add_filter "/test/"
    add_filter "/lib/certainty/coverage"
    instance_eval(&COVERAGE)
  end
end
