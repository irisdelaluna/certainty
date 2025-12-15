# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs += %w[test lib]
  t.pattern = "test/**/*_test.rb"
end

require "rubocop/rake_task"

RuboCop::RakeTask.new

task lint: %i[rubocop]

task default: %i[test lint]
