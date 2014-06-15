# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "doc2json/version"

Gem::Specification.new do |s|
  s.name        = "doc2json"
  s.version     = Doc2Json::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jens Nazarenus"]
  s.email       = ["jens@0x6a.de"]
  s.homepage    = "https://github.com/jens-na/doc2json"
  s.summary     = %q{Generate json based ruby documentation}

  s.add_runtime_dependency("yard", "~> 0.8.7.4")
  s.add_runtime_dependency("json", "~> 1.8.1")

  s.add_development_dependency("rspec", "~>2.14.1")
  s.add_development_dependency('rake', "~> 10.1.1")
  s.add_development_dependency('redgreen', "~> 1.2.2")
  s.add_development_dependency('shoulda-context', "~> 1.1.6") 
  s.add_development_dependency('rr', "~> 1.1.2")

  s.add_development_dependency('pry')
  s.add_development_dependency('pry-nav')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

