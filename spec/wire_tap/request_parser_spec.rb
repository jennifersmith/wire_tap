require 'spec_helper'
module WireTap
	describe RequestParser do
		subject {RequestParser.parse(request)}
		context "parsing an empty request" do
			let(:request) {""}
			it { should be_empty}
		end
		context "parsing a request with two strings" do
			let(:request) {"foo=bar&bob=bill"}
			its(["foo"]){ should == "bar"}
			its(["bob"]){ should == "bill"}
		end
		context "parsing a request with two values for the same key" do
			let(:request) {"foo=bar&foo=bob"}
			its(["foo"]){ should == ["bar", "bob"]}
		end
	end
end
