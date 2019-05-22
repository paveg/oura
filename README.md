Oura
====

[![CircleCI](https://circleci.com/gh/paveg/oura.svg?style=svg&circle-token=510e032854535d58837e088b89650cc931ae12be)][circleci]
[![Codecov](https://codecov.io/gh/paveg/oura/branch/master/graph/badge.svg)][codecov]
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)][license]
[![Renovate](https://badges.renovateapi.com/github/paveg/oura)][renovate]

[circleci]: https://circleci.com/gh/paveg/oura
[codecov]: https://codecov.io/gh/paveg/oura
[license]: https://github.com/paveg/oura/blob/master/LICENSE
[renovate]: https://github.com/renovatebot/renovate

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

```ruby
# DEVELOPMENT=true bundle console
client = ::Oura::Client.new(access_token: your_token)
# input your code
client.userinfo
=> #<Oura::Model::UserInformation:0x00007fc2492e59d8>
```

### not in develop-mode

#### Set Environment

|Environment|Explanation|
|:---:|:---:|
| `OURA_CLIENT_ID` | client id |
| `OURA_CLEINT_SECRET` | client secret |
| `AUTHORIZE_HEADER_CODE` | authrize header code |
| `OURA_CALLBACK_URI` | callback uri |


```ruby
# bundle console
client = ::Oura::Client.new(access_token: your_token)
client.userinfo
=> #<Oura::Model::UserInformation:0x00007fc2492e59d8
 @attrs=
  {:weight=>64,
   :age=>27,
   :gender=>"male",
   :email=>"example@gmail.com",
   :user_id=>"XXXXXX",
   :height=>170,
   :date=>"2019-02-03"}>

# client.sleep_period(start_date: 2.days.ago, end_date: Date.doday)
# client.activity(start_date: 2.days.ago, end_date: Date.doday)
# client.readiness(start_date: 2.days.ago, end_date: Date.doday)
```

## References

- [Official Site](https://ouraring.com/)
- [API Document](https://cloud.ouraring.com/docs/)

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
