
require 'spec_helper'
describe WireTap::Listener do
  context "saving request details" do
    include Rack::Test::Methods
    let(:app){
      WireTap::Listener.new(wrapped_app)
    }
    context "for a get request" do
      before(:each) do
        get "/foo"
      end
      let(:wrapped_app){ 
        class SinatraApp < BasicWebApp
          get("/foo") { "Hello world"}
        end
        SinatraApp.new
      }
      describe "the recorded transaction" do
        subject {app.transactions.last}
        its([:method]) { should == "GET"}
        its([:path]) { should == "/foo"}
        its([:request]) { should be_empty}
        its([:status]) { should == 200}
        its([:content_type]) { should match /^text\/html/}
        its([:body]) { should==["Hello world"]}
      end
    end
    context "for a post request" do
      before(:each) do
        post "/bar",{:id=>123, :name=>"bob"}
      end
      let(:wrapped_app) {
        class SinatraApp < BasicWebApp
          post("/bar") do
            "#{params[:id]} : Hello, #{params[:name]}"
          end
        end
        SinatraApp.new
      }
      describe "the recorded transaction" do
        subject{app.transactions.last}
        its([:method]){ should == "POST"}
        its([:request]){ should == {"id"=>"123", "name"=>"bob"}}
      end
    end
  end
end
