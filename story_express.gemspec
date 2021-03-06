# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'story_express/version'

Gem::Specification.new do |spec|
  spec.name          = "story_express"
  spec.version       = StoryExpress::VERSION
  spec.authors       = ["Shelby Doolittle"]
  spec.email         = ["shelby@shelbyd.com"]
  spec.summary       = %q{Story Express delivers your stories to your PM.}
  spec.description   = %q{Run story express at the end of your build to automatically deliver all the stories that passed the build.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "pivotal-tracker", "~> 0.5"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
