# GmHashWrapper

The usage of this gem is similar to OpenStruct gem. It contains 2 different classes for wrapping hash into object:
  * One of them just tries to wrap hash.
  * Second one raises an error.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gm_hash_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gm_hash_wrapper

## Usage

  * HashWrapper

hash = { key1: "value1", "key2": "value2" }
wrapped_hash = GmHashWrapper::HashWrapper.new(hash)

* StrictHashWrapper

hash = { key1: "value1", "key2": "value2" }
strict_wrapped_hash = GmHashWrapper::StrictHashWrapper.new(hash)

Other usage examples you can find in tests.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gm_hash_wrapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

