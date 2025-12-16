# Certainty

Ubiquitous unit testing facilities to eliminate doubt.

This hand-crafted collection of assertions and test helpers makes it trivial to prove common functionalities with utmost certainty.

## Dependencies

Works with [Minitest](https://github.com/minitest/minitest) version 5.0 and older.

## Installation

Add to your `Gemfile` with [Bundler](https://bundler.io):

```sh
bundle add certainty
```

Alternatively, use [RubyGems](https://rubygems.org/):

```sh
gem install certainty
```

## Usage

**Let's break some rules!**

Remove `test/test_helper.rb` if exists...

To your `Rakefile` add:

```ruby
require "certainty/proof_tasks.rb"
```

Setup with:

```sh
bundle exec rake sure
```

Now there exists `test/config.rb`, and your tests may look like this:

```ruby
require "config"

class MyTest < Test
  include Certainty::Order

  def test_list_ordering
    assert_order [ 1, 2, 3 ], :asc
  end
end
```

Assertion modules (like `Certainty::Order` are auto-loaded, so there is no need to `require`.

Top-level `Test`, `Benchmark`, and `Reporters` are aliases for those from `Minitest`.

Default report setting is:

```rb
Reporters.use! [SpecReporter.new(color: true)]
```

### Assertions

TODO: Document available assertions.

## Development

After checking out the repo, kick-start development environment with:

```sh
bin/setup
```

The interactive prompt will allow you to experiment:

```sh
bin/console
```

To test, lint, and benchmark:

```sh
bundle exec rake test loads test/**/*_test.rb
bundle exec rake benchmark # loads test/**/*_benchmark.rb
bundle exec rake lint # Calls the RuboCop
bundle exec rake # all of the above
```

Auto-fix correctable lint offenses:

```sh
bundle exec rake fix
bundle exec rake fix:all

To install this gem onto your local machine:

```sh
bundle exec rake install
```

### Shipment

**Before the release** of a new version, update the version number in `version.rb`. 

Publish to gem host with:

```sh
bundle exec rake release
```

This will:

- create a git tag for the version;
- push git commits together with created tag;
- upload the `.gem` file to [RubyGems](https://rubygems.org) (or your private gem host).

## Contributing

Reported [issues](https://github.com/irisdelaluna/certainty/issues) and constructive [pull requests](https://github.com/irisdelaluna/certainty/pulls) are kindly welcome, and appreciated.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
