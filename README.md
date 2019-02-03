Oura
====

[![CircleCI](https://circleci.com/gh/paveg/oura.svg?style=svg&circle-token=510e032854535d58837e088b89650cc931ae12be)][circleci]
[![codecov](https://codecov.io/gh/paveg/oura/branch/master/graph/badge.svg)][codecov]

[circleci]: https://circleci.com/gh/paveg/oura
[codecov]: https://codecov.io/gh/paveg/oura

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oura'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oura

## Usage

### in develop-mode

```irb
$ DEVELOPMENT=true bundle console
$ client = Oura::Client.new(access_token: your_token)
$ # <input your code>
$ response = client.user_info # or sleep_period, activity, readiness
$ response.body
$ => "{\"weight\": 50, \"age\": 22, \"gender\": \"male\", \"email\": \"oura@example.com\", \"user_id\": \"XXXXXXXX\", \"height\": 170, \"date\": \"2019-02-03\"}"
```

### not in develop-mode

```bash
$ bundle console
$ > client = Oura::Client.new(access_token: <your token>)
$ > client.user_info # or sleep_period, activity, readiness
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. 

Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paveg/oura.

This project is intended to be a safe, welcoming space for collaboration,
 
 and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Oura project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/oura/blob/master/CODE_OF_CONDUCT.md).
