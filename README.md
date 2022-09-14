# Omniauth::Savvycal

This gem provides an OmniAuth strategy for authenticating with [SavvyCal](https://www.savvycal.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-savvycal'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-savvycal

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :savvy_cal, ENV['SAVVYCAL_KEY'], ENV['SAVVYCAL_SECRET']
end
```


## Basic Usage Rails

In `config/initializers/savvy_cal.rb`

```ruby
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :savvy_cal, ENV['SAVVYCAL_KEY'], ENV['SAVVYCAL_SECRET']
  end
```

### With Devise

In `config/initializers/devise.rb`

```ruby
  config.omniauth :savvy_cal, ENV['SAVVYCAL_KEY'], ENV['SAVVYCAL_SECRET']
  
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on Savvycal at https://savvycal.com/julianrubisch/omniauth-savvycal.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
