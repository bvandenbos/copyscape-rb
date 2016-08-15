require 'copyscape/request_base'

module Copyscape
  
  class TextSearch < RequestBase

    def initialize(text, encoding = 'UTF-8')
      comparision_level = Copyscape.comparision_level ? Copyscape.comparision_level.to_s : '0'
      http_response = post_response(o: 'csearch', t: text, e: encoding, c: comparision_level)
      @response = Response.new(http_response)
    end

  end
  
end