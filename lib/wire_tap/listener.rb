require 'cgi'
require 'wire_tap/request_parser'
module WireTap
	class Listener
		attr_reader :transactions
		def initialize app
			@app = app	
			@transactions = []
		end
		def call(env)
			response = @app.call(env)		
			@transactions << parse_transaction(env, response)
			response
		end
		def parse_request(request)
			RequestParser.parse(request)
		end
		def parse_response(response)
			status,headers,body = response
			{
				:status => status,
				:content_type => headers["Content-Type"],
				:body => body
			}
		end
		def parse_transaction(env, response)
			{
				:method=>env["REQUEST_METHOD"],
				:path=>env["PATH_INFO"],
				:request => parse_request(env["rack.input"].read)	
			}.merge(parse_response(response))
		end
		def wrapped_app
			@app
		end
	end
end
