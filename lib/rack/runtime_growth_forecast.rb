require 'rack/runtime_growth_forecast/version'
require 'growthforecast'

module Rack
  class RuntimeGrowthForecast
    def initialize(app, options = {})
      default_options = {
        host: 'localhost',
        port: 5125,
        name: nil,
      }

      @app = app
      @options = default_options.merge(options)
    end

    def call(env)
      request = Rack::Request.new(env)
      status, headers, body = @app.call(env)

      if headers.has_key?('X-Runtime') && request.path_info !~ /\.[^.]+$/
        growth_forecast = GrowthForecast.new(@options[:host], @options[:port])
        runtime = (headers['X-Runtime'].to_f * 1000).to_i
        begin
          growth_forecast.post(@options[:name], 'X-Runtime', 'all', runtime)
        rescue
          puts 'ERROR: Failed to post X-Runtime to GrowthForecast'
        end
      end

      [status, headers, body]
    end
  end
end
