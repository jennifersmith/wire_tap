require 'rspec'
require "factory_girl"
require 'rack/test'
require "factories" #wtf
require 'wire_tap'

class FakeRackApp
	def call(env)
		[200, {"Content-Type" => "text/plain"}, ["Hello world!"]]
	end
end

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
