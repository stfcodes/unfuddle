# -*- encoding: utf-8 -*-
require File.expand_path('../lib/unfuddle/core/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["shuriu"]
  gem.email         = ["stefan.rotariu@gmail.com"]
  gem.description   = %q{Unfuddle API wrapper}
  gem.summary       = %q{Unfuddle API wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "unfuddle"
  gem.require_paths = ["lib"]
  gem.version       = Unfuddle::VERSION

  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_dependency 'multi_json', '~> 1.3'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
