# frozen_string_literal: true

begin
  require "rubocop/rake_task"
rescue LoadError
  warn "YO! No RuboCop? Linting disabled."
else
  RuboCop::RakeTask.new :lint

  desc "Fix correctable offenses"
  task fix: "lint:autocorrect"

  desc "Fix all offenses"
  task "fix:all": "lint:autocorrect_all"
end
