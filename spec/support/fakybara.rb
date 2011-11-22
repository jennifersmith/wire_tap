module Capybara
	class << self
		class FakeApp
			def call(env)
			end
		end
		def reset
			@original_app = FakeApp.new
			@app = @original_app
		end
		attr_reader :original_app
		attr_accessor :app
	end
end

RSpec.configure do |config|
	config.before(:each) do
		Capybara.reset
	end
end
