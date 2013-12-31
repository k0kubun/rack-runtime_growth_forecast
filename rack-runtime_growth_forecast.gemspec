# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/runtime_growth_forecast/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-runtime_growth_forecast"
  spec.version       = Rack::RuntimeGrowthForecast::VERSION
  spec.authors       = ["Takashi Kokubun"]
  spec.email         = ["takashikkbn@gmail.com"]
  spec.summary       = %q{Rack middleware to post X-Runtime to GrowthForecast}
  spec.description   = %q{A simple Rack middleware to post X-Runtime to GrowthForecast}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
  spec.add_dependency "growthforecast", "~> 0.0.4"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
