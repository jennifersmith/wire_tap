require 'spec_helper'
describe WireTap::Listener do
	it "should delegate to the wrapped application when we call" do
		wrapped_app = stub()
		wrapped_app.should_receive(:call).with(:env)
		listener = WireTap::Listener.new wrapped_app
		listener.call(:env)
	end
end
