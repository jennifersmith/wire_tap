require 'spec_helper'
module WireTap
  describe Main do
    context "start" do
      before(:each) do
        WireTap::Main.new.start
      end
      describe "the capybara app" do
        subject { Capybara.app }
        its(:class) { should == WireTap::Listener}
        its(:wrapped_app) {should == Capybara.original_app}
      end
    end
    context "dump" do
      before(:each) do
        tmp_dir = File.join(Dir::tmpdir, "wire_tap_#{Time.now.to_i}_#{rand(100)}")
        Dir.mkdir(tmp_dir)
        wire_tap = WireTap::Main.new
        wire_tap.dump
      end
      describe "the output file"
    end
  end
end
 
