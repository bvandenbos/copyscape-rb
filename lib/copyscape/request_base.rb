require 'forwardable'
require 'httparty'

module Copyscape
  
  class RequestBase

    include HTTParty
    base_uri 'http://www.copyscape.com/api'

    extend Forwardable
    
    def_delegators :response, :duplicate_count, :duplicates, :duplicate?,
                   :count, :error, :error?, :query, :query_words, :raw_response

    def base_params
      raise "You must set Copyscape.username" unless Copyscape.username
      raise "You must set Copyscape.api_key" unless Copyscape.api_key
      {:u => Copyscape.username,
       :k => Copyscape.api_key}
    end
    
    def response
      raise "@response must be set" unless @response
      @response
    end
    
    def get_response(params)
      self.class.get('/', :query => base_params.merge(params)).body
    end
    
    def post_response(params)
      self.class.post('/', :body => base_params.merge(params)).body
    end   
  end
end
