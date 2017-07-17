# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'yourls_shortener'
  s.version     = '0.0.1'
  s.date        = '2015-01-29'
  s.summary     = "Shortens and expands your URLs via YOURLS"
  s.description = "Uses RestClient to shorten and expand urls via YOURLS"
  s.authors     = ["Derek Harms"]
  s.email       = 'derekharms@gmail.com'
  s.homepage    =  'http://rubygems.org/gems/yourls_shortener'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rest-client", ">= 1.8", "< 3.0"
  s.add_dependency 'hashie', '>= 2.1.0'
  s.add_dependency "activesupport", ">= 3.0"

  s.add_development_dependency "rspec", "~> 3.1.0"
  s.add_development_dependency "vcr", "~> 2.9.3"
  s.add_development_dependency "pry", "~> 0.10.1"
end
