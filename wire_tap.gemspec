# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wire_tap/version"

Gem::Specification.new do |s|
  s.name        = "wire_tap"
  s.version     = WireTap::VERSION
  s.authors     = ["Jennifer Smith"]
  s.email       = ["jensmith@thoughtworks.com"]
  s.homepage    = "https://github.com/jennifersmith/wire_tap"
  s.summary     = "Rack middleware that logs API calls made to a file for documentation"
  s.description = "Rack middleware that logs API calls made to a file for documentation. This gem is being developed for the RapidFTR project - www.rapidftr.com"
 

  s.rubyforge_project = "wire_tap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

	s.add_runtime_dependency "rack"
  s.add_runtime_dependency "contracted"
  
	s.add_development_dependency "rspec"
	s.add_development_dependency "rack-test"
	s.add_development_dependency "factory_girl"
  s.add_development_dependency "i18n"
end
