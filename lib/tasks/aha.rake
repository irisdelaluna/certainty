# frozen_string_literal: true

file "test/config.rb" do |file|
  mkdir_p "test"
  source = File.expand_path("../test/config.rb", __dir__)
  cp source, file.name
end

desc "Install certainty"
task aha: ["test/config.rb"]
