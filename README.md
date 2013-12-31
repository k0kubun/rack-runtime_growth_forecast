# Rack::RuntimeGrowthForecast

A simple Rack middleware to post X-Runtime to GrowthForecast

## Usage

```ruby
# Gemfile
gem 'rack-runtime_growth_forecast'
```

```ruby
# config/application.rb
module YourRailsApp
  class Application < Rails::Application
    # ...
    options = {
      host: 'localhost',    # optional (default: localhost)
      port: 5125,           # optional (default: 5125)
      name: 'your app name' # required
    }
    config.middleware.insert_before Rack::Runtime, Rack::RuntimeGrowthForecast, options
  end
end
```

## Contributing

1. Fork it ( http://github.com/tkkbn/rack-runtime_growth_forecast/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
