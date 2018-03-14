require 'copyscape/response'
require 'copyscape/url_search'
require 'copyscape/text_search'
require 'copyscape/balance'
require 'copyscape/version'

module Copyscape
  class << self
    attr_accessor :username, :api_key

    def url_search(*args)
      UrlSearch.new(*args)
    end

    def text_search(*args)
      TextSearch.new(*args)
    end

    def balance(*args)
      Balance.new(*args)
    end
  end
end
