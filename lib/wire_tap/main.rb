module WireTap	
  class Main
    attr_reader :listener
    def initialize options={}
      @options = options
    end
    def start
      @listener = WireTap::Listener.new(Capybara.app)
      Capybara.app = @listener
    end
    def dump
      File.open(File.join(@options[:output_directory], "wire_tap.html"), "w") do |file|
        file.write(@options[:formatter].format(@listener))
      end
    end
    def logger
    end
  end
end
