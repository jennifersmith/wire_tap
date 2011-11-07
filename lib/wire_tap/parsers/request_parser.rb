require 'cgi'
module WireTap
	class RequestParser
		class << self 
			def parse request
				clean(CGI.parse(request))
			end
			def clean kv_pairs
				kv_pairs.reduce({}) do |result, kv|
					key,value = kv
					value = value.first if value.length <=1
					result[key] = value
					result
				end
				
			end
		end
	end
end
