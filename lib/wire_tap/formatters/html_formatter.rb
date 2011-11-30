require 'haml'

module WireTap
  module Formatters
    class HtmlFormatter
      def format input
        engine = Haml::Engine.new(File.read("lib/wire_tap/formatters/templates/index.haml"))
        engine.render
      end
    end
  end
end
