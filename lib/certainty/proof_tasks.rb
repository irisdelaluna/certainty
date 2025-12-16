# frozen_string_literal: true

# Test tasks to set up.
#
# Each implies loading tests from `test/**/*_(aspect).rb`.
#
# Can override these defaults in `Rakefile` before requiring `certainty/proof_tasks`.
TEST_ASPECTS = %i[
  test
  benchmark
].freeze unless defined? TEST_ASPECTS

# NOTE: Install rake library from `certainty/tasks`.

Rake.add_rakelib File.realpath(File.join(File.dirname(__FILE__), "../tasks"))

desc "Fix offenses"
task fix: ["lint:autocorrect"]
