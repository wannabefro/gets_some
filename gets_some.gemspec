# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gets_some/version'

Gem::Specification.new do |spec|
  spec.name          = "gets_some"
  spec.version       = GetsSome::VERSION
  spec.authors       = ["Samuel McTaggart"]
  spec.email         = ["sam.mctaggart@gmail.com"]
  spec.description   = %q{Extra methods for gets}
  spec.summary       = %q{Gets some}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
