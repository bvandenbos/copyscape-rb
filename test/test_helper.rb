require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/setup'
require 'pry'

$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__)) + '/../lib'

require 'copyscape'

Copyscape.username = 'joe'
Copyscape.api_key = '123abc'
