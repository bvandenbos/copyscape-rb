require 'copyscape/request_base'

module Copyscape
  class UrlSearch < RequestBase
    # The parameters are as follows:
    # Parameter Explanation         Value                    Required? Default
    # u         Your username       [your username]          Yes       -
    # k         Your API key        [your API key]           Yes       -
    # o         API operation       csearch (or psearch or
    #  cpsearch if you create a private index)               Yes       -
    # e         Text encoding       [encoding name]          Yes       -
    # t         Text to be searched [the text]               Yes       -
    # c         Full comparisons    0 to 10                  No        0
    # f         Response format     xml or html              No        xml
    # x         Example test        1 or omitted             No        -
    #
    def initialize(url, options = {})
      options = {
        q: url,
        o: 'csearch',
        f: 'xml'
      }.merge(options)

      http_response = get_response(options)
      @response = Response.new(http_response)
    end
  end
end
