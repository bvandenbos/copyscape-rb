# -*- encoding: utf-8 -*-

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'copyscape/version'

Gem::Specification.new do |s|
  s.name        = 'galetahub-copyscape'
  s.version     = Copyscape::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ben VandenBos', 'Galeta Igor']
  s.email       = ['bvandenbos@gmail.com', 'galeta.igor@gmail.com']
  s.homepage    = 'https://github.com/galetahub/copyscape-rb'
  s.summary     = 'Ruby wrapper for Copyscape API'
  s.description = 'Ruby wrapper for Copyscape API'

  s.required_rubygems_version = '>= 1.3.6'

  s.files = Dir['{lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['{test}/**/*']
  s.extra_rdoc_files = ['README.md']
  s.require_paths = ['lib']

  s.add_dependency('httparty', '>= 0.15.0')
  s.add_dependency('nokogiri', '>= 1.8.0')

  s.add_development_dependency('mocha')
  s.add_development_dependency('shoulda-context')
end
