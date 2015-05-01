# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yify/version'

Gem::Specification.new do |spec|
  spec.name          = "yify"
  spec.version       = Yify::VERSION
  spec.authors       = ["Juan Gesino"]
  spec.email         = ["juangesino@gmail.com"]
  spec.summary       = %q{Simple Ruby wrapper for YIFY's API}
  spec.description   = %q{A very simple and easy Ruby wrapper for YIFY's API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
