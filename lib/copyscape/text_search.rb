require 'copyscape/request_base'

module Copyscape
  
  class TextSearch < RequestBase

    def initialize(text, encoding = 'UTF-8', options = {})
      options = {
        :t => text,
        :e => encoding,
        :o => "csearch",
        :f => "xml"
      }.merge(options)

      http_response = post_response(options)
      @response = Response.new(http_response)
    end

  end
  
end