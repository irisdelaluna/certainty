# frozen_string_literal: true

begin
  require "minitest"
  require "rake/testtask"
rescue LoadError
  warn "YO! No Minitest? Testing disabled."
else
  libs = %w[test lib]
  glob = -> { "test/**/*_#{_1}.rb" }

  TEST_ASPECTS.each do |(type, suffix)|
    suffix ||= type.to_s
    Rake::TestTask.new type do |t|
      t.libs += libs
      t.pattern = glob[suffix]
      t.options = "-- --coverage" if type == :test
    end
  end
end if defined?(TEST_ASPECTS) && TEST_ASPECTS.to_a.any?
