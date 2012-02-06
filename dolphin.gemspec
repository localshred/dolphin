# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dolphin/version"

Gem::Specification.new do |s|
  s.name        = "dolphin"
  s.version     = Dolphin::VERSION
  s.authors     = ["BJ Neilsen"]
  s.email       = ["bj.neilsen@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "dolphin"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "redis"
  
  s.add_development_dependency "rspec", "~> 2.8"
  s.add_development_dependency "yard", "~> 0.7"
  s.add_development_dependency "simplecov", "~> 0.5"
end
