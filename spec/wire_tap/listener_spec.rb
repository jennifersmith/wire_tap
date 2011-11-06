
require 'spec_helper'
describe WireTap::Listener do
	context "saving request details" do
		include Rack::Test::Methods
		let(:app){
			WireTap::Listener.new(FakeRackApp.new)
		}
		context "receiving a get request" do
			before(:each) do
				get "/foo"
			end
			describe "the recorded transaction" do
				let(:transaction) {app.transactions.last}
				describe "request" do
					subject {transaction.request} # what is a saner term for a pair of request/response
					its(:method){subject.should == "GET"}
				end
			end
		end

	end
end
