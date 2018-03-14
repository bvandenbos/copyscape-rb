# -*- encoding: utf-8 -*-
require File.expand_path('../lib/copyscape/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "copyscape"
  s.version     = Copyscape::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ben VandenBos']
  s.email       = ['bvandenbos@gmail.com']
  s.homepage    = "http://github.com/bvandenbos/copyscape-rb"
  s.summary     = "Ruby wrapper for Copyscape API"
  s.description = "Ruby wrapper for Copyscape API"

  s.required_rubygems_version = '>= 1.3.6'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'

  s.add_dependency('httparty', '>= 0.15.0')
  s.add_dependency('nokogiri', '>= 1.8.0')

  s.add_development_dependency('mocha')
  s.add_development_dependency('shoulda-context')
end
