require 'main'
module WireTap
  class << self
    wire_tap = WireTap::Main.new
    def start 
      wire_tap.start
    end
    def dump
      wire_tap.dump
    end
    def logger
      wire_tap.logger
    end
  end
end
