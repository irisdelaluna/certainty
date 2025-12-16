# frozen_string_literal: true

# Test coverage configuration (for `SimpleCov.start`).
# Can be defined in `test/config.rb` before `require "aha"`.
COVERAGE = lambda do |*|
end unless defined? COVERAGE

begin
  require "simplecov"
rescue LoadError
  warn "YO! No SimpleCov? Code coverage disabled."
else
  SimpleCov.start do
    enable_coverage :branch
    add_filter "/test/"
    add_filter "/lib/certainty/coverage"
    instance_eval(&COVERAGE)
  end
end if ARGV.include?("--coverage")
