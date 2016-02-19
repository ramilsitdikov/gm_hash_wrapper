# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gm_hash_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "gm_hash_wrapper"
  spec.version       = GmHashWrapper::VERSION
  spec.authors       = ["Ramil Sitdikov"]
  spec.email         = ["sitdikov.ramil@gmail.com"]
  spec.summary       = %q{Hash Wrapper}
  spec.description   = %q{Hash Wrapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
