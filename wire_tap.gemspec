# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wire_tap/version"

Gem::Specification.new do |s|
  s.name        = "wire_tap"
  s.version     = WireTap::VERSION
  s.authors     = ["Jennifer Smith"]
  s.email       = ["jennifer@home"]
  s.homepage    = "https://github.com/jennifersmith/wire_tap"
  s.summary     = "Rack middleware that logs API calls made to a file for documentation"
  s.description = "Rack middleware that logs API calls made to a file for documentation. This gem is being developed for the RapidFTR project - www.rapidftr.com"
 

  s.rubyforge_project = "wire_tap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end