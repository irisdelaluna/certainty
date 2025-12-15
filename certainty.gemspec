# frozen_string_literal: true

require_relative "lib/certainty/version"

Gem::Specification.new do |spec|
  spec.name = "certainty"
  spec.version = Certainty::VERSION
  spec.required_ruby_version = ">= 3.2"
  spec.license = "MIT"
  spec.authors = ["Irys Łuna"]
  spec.email = ["dude@irysek.pro"]
  spec.homepage = "https://irysek.pro/ruby/gem/certainty"

  readme = File.read("README.md").lines.map(&:strip).reject(&:empty?)
  spec.summary, spec.description = readme[1..2]

  spec.metadata.merge!(
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github/irisdelaluna/certainty"
  )

  globs = %w[lib/**/*.rb *.gemspec **/*.md Rakefile LICENSE*]
  spec.files = globs.flat_map(&Dir.method(:glob))
  spec.require_paths = ["lib"]

  spec.add_dependency "minitest", ">= 5.0"
end
