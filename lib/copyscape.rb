require 'copyscape/response'
require 'copyscape/url_search'
require 'copyscape/text_search'
require 'copyscape/balance'
require 'copyscape/version'

module Copyscape
  
  class << self

    attr_accessor :username, :api_key
    
    def url_search(url)
      UrlSearch.new(url)
    end
    
    def text_search(*prms)
      TextSearch.new(*prms)
    end

    def balance(format)
      Balance.new(format)
    end
    
  end
   
end