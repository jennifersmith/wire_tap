require 'spec_helper'
module WireTap
  module Formatters
    describe HtmlFormatter do
      before (:each) do
        @formatter = HtmlFormatter.new
      end
      subject {
        Nokogiri::HTML(@formatter.format(input))
      } 
      context "with no requests" do
        let(:input){ double(WireTap::Listener)}
        describe "Basic header information" do
          its (:title) { should == "WireTap output"}
  
        end
      end
    end
  end
end
