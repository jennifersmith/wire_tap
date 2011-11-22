module WireTap	
	class Main
		def start
			Capybara.app = WireTap::Listener.new(Capybara.app)
		end
		def dump
		end
		def logger
		end
	end
end
