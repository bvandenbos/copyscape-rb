require 'copyscape/request_base'

module Copyscape
  class Balance < RequestBase
    def initialize(format = :xml, options = {})
      options = {
        f: format.to_s,
        o: 'balance'
      }.merge(options)

      http_response = get_response(options)
      @response = Response.new(http_response)
    end
  end
end
