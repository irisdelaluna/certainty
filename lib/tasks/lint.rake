# frozen_string_literal: true

begin
  require "rubocop/rake_task"
rescue LoadError
  warn "YO! No RuboCop? Linting disabled."
else
  RuboCop::RakeTask.new :lint

  task fix: "lint:autocorrect"
  task "fix:all": "lint:autocorrect_all"
end
