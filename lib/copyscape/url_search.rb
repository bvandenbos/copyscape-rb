require 'copyscape/request_base'

module Copyscape
  
  class UrlSearch < RequestBase
    
    def initialize(url)
      http_response = get_response(:o => 'csearch', :q => url)
      @response = Response.new(http_response)
    end
    
  end
  
end
