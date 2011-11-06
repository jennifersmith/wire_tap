module WireTap
	class Transaction
		attr_reader :method, :path, :request, :status, :body
		def initialize env, response
			@method = env["REQUEST_METHOD"]
			@path = env["PATH_INFO"]
			@request = env["rack.input"].read
			@status,@headers,@body = response
		end
		def content_type
			@headers["Content-Type"]
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
			response = @app.call(env)		
			@transactions << Transaction.new(env, response)
			response
		end
	end
end
