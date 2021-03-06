# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bestgems/version'

Gem::Specification.new do |spec|
  spec.name          = "bestgems"
  spec.version       = Bestgems::VERSION
  spec.authors       = ["kyoendo"]
  spec.email         = ["postagie@gmail.com"]
  spec.summary       = %q{Ruby wrapper for the BestGems.org API}
  spec.homepage      = "https://github.com/melborne/bestgems"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
