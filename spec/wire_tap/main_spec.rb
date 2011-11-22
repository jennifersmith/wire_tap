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
        @tmp_dir = File.join(Dir::tmpdir, "wire_tap_#{Time.now.to_i}_#{rand(100)}")
        FileUtils.mkdir_p(@tmp_dir)
        fake_formatter = double("Formatter")
        wire_tap = WireTap::Main.new({:output_directory => @tmp_dir, :formatter => fake_formatter})
        fake_formatter.stub(:format).with(wire_tap.listener){ "FAKE_CONTENT" } 
        wire_tap.dump
      end
      after(:each) do
        FileUtils.rm_rf(@tmp_dir)
      end
      describe "the output file" do
        subject {File.join(@tmp_dir, "wire_tap.html")}
        it { should be_a_file}
        it { should have_contents "FAKE_CONTENT"}
      end
    end
  end
end 
