require 'rspec'
require "factory_girl"
require "factories" #wtf
require 'wire_tap'

class FakeRackApp
	def call(env)
	end
end

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
