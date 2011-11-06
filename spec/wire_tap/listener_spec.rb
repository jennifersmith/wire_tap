
require 'spec_helper'
describe WireTap::Listener do
	context "saving request details" do
		include Rack::Test::Methods
		let(:app){
			WireTap::Listener.new(wrapped_app)
		}
		context "receiving a get request" do
			before(:each) do
				get "/foo"
			end
			let(:wrapped_app){ 
				class SinatraApp < BasicWebApp
					get "/foo" do
						"Hello world"
					end
				end
			  SinatraApp.new
			}
			describe "the recorded transaction" do
				subject {app.transactions.last}
				its(:method){subject.should == "GET"}
				its(:path){subject.should == "/foo"}
				its(:request){subject.should be_empty}
				its(:status){subject.should == 200}
				its(:content_type){subject.should match /^text\/html/}
				its(:body){subject.should==["Hello world"]}
			end
		end

	end
end
