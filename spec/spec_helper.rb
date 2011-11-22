require 'rspec'
require 'fileutils'
require "factory_girl"
require 'rack/test'
require 'wire_tap/main'
require 'wire_tap/request_parser'
require 'wire_tap/listener'
Dir['./spec/support/**/*.rb'].map {|f| require f}



class FakeRackApp
	def call(env)
		[200, {"Content-Type" => "text/plain"}, ["Hello world!"]]
	end
end

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
