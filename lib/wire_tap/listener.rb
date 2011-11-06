module WireTap
	class Transaction
		attr_reader :request, :response
		def initialize env
			puts env.inspect
			@request = Request.new env
		end
	end
	class Request
		attr_reader :method
		def initialize env
			@method = env["REQUEST_METHOD"]
		end
	end
	class Listener
		attr_reader :transactions
		def initialize app
			@app = app	
			@transactions = []
		end
		def call(env)
			@transactions << Transaction.new(env)
			@app.call(env)		
		end
	end
end
