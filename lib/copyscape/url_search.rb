require 'copyscape/request_base'

module Copyscape
  
  class UrlSearch < RequestBase
    
    def initialize(url, options = {})
      options = {
        :q => url,
        :o => "csearch",
        :f => "xml"
      }.merge(options)

      http_response = get_response(options)
      @response = Response.new(http_response)
    end
    
  end
  
end
