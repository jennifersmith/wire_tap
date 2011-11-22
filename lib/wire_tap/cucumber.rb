Before do
	WireTap.start
end

After do
	begin
		WireTap.dump
	rescue Exception =>  e
		WireTap.logger.error "Exception encountered by WireTap in Cucumber After block: #{e}"
	end
end
