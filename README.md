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

Require `certainty` in `test/test_helper.rb`, then in your test case include selected assertions:

```ruby
class MyTest < Minitest::Test
  include Certainty::Order

  def test_list_ordering
    assert_order [ 1, 2, 3 ], :asc
  end
end
```

The modules containing assertions will be auto-loaded, so there is no need to `require` those explicitly.

## Development

After checking out the repo, kick-start development environment with:

```sh
bin/setup
```

The interactive prompt will allow you to experiment:

```sh
bin/console
```

To test and lint, use:

```sh
bundle exec rake
```

To install this gem onto your local machine:

```sh
bundle exec rake install
```

## Shipment

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
