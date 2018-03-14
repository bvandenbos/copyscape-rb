# encoding: utf-8

require 'rake'
require 'rake/testtask'

require File.join(File.dirname(__FILE__), 'lib', 'copyscape', 'version')

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the enum_field plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
