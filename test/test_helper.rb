require 'rubygems'
require 'test/unit'
require 'shoulda-context'
require 'mocha'

$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__)) + '/../lib'

require 'copyscape'

Copyscape.username = 'joe'
Copyscape.api_key = '123abc'
