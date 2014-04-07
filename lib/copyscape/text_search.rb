require 'copyscape/request_base'

module Copyscape

  class TextSearch < RequestBase

    def initialize(text, encoding = 'UTF-8')
      http_response = post_response(:o => 'csearch', :t => text, :e => encoding)
      @response = Response.new(http_response)
    end

  end

end