# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'controls/version'

Gem::Specification.new do |spec|
  spec.name          = 'scenario_context'
  spec.version       = Controls::VERSION
  spec.authors       = ['Erran Carey']
  spec.email         = ['me@errancarey.com']
  spec.description   = %q(This gem provides ScenarioContext)
  spec.summary       = %q(This gem provides ScenarioContext)
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'cucumber'
end
