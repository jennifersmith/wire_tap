require 'spec_helper'
module WireTap
  module Formatters
    describe HtmlFormatter do
      before (:each) do
        @formatter = HtmlFormatter.new
      end
      let(:document) {
        Nokogiri::HTML(@formatter.format(input))
      } 
      context "with no requests" do
        let(:input){ double(WireTap::Listener)}
        describe "Basic header information" do
          describe "title" do
            subject{document.title}
            it{ should == "WireTap output"}
          end
        end
      end
    end
  end
end
