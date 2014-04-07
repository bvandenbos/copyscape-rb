require 'copyscape/request_base'

module Copyscape

  class Balance < RequestBase

    def initialize(format = :xml, encoding = 'UTF-8')
      http_response = get_response_balance(format)
      @response = Response.new(http_response)
    end

  end

end