# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create do |t|
  t.libs += %w[test lib]
  t.test_globs = %w[test/**/*_test.rb]
end

require "rubocop/rake_task"

RuboCop::RakeTask.new

task lint: %i[rubocop]

task default: %i[test lint]
