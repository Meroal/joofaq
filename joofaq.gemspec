# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'joofaq/version'

Gem::Specification.new do |gem|
  gem.name          = "joofaq"
  gem.version       = Joofaq::VERSION
  gem.authors       = ["Jonathan Pagano"]
  gem.email         = ["jonathanpagano@gmail.com"]
  gem.description   = %q{FAQ page template building gem}
  gem.summary       = %q{Easily implement dynamic FAQ pages into your rails app}
  gem.homepage      = "https://github.com/joofsh/joofaq"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
