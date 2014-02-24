$:.push File.expand_path("../lib", __FILE__)
require "omniauth-revrise/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-revrise"
  s.version     = OmniAuth::Revrise::VERSION
  s.authors     = ["Jonas Arnklint"]
  s.email       = ["jonas.arnklint@revrise.com"]
  s.homepage    = "https://github.com/arnklint/omniauth-revrise"
  s.summary     = %q{OmniAuth strategy for RevRise}
  s.description = %q{Easy peasy authentication for the RevRise hub using Ruby.}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'multi_json',        '~> 1.3'
  s.add_dependency 'omniauth',          '~> 1.0'
  s.add_dependency 'omniauth-oauth2',   '~> 1.1.2'

  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
end
