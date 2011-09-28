require 'spec_helper'

describe WireTap do
	it "should return a rack app on create" do
		wire_tap = WireTap::Listener.new(FakeRackApp.new)
  	wire_tap.should respond_to(:call)
	end
end
