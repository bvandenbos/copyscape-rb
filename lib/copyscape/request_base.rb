require 'forwardable'
require 'httparty'

module Copyscape

  class RequestBase
    include HTTParty
    extend Forwardable
    
    base_uri 'http://www.copyscape.com/api'

    def_delegators :response, :duplicate_count, :duplicates, :duplicate?,
                   :count, :error, :error?, :query, :query_words, :raw_response,
                   :allwordsmatched, :allpercentmatched, :alltextmatched, :allviewurl

    # API operation (o): Use csearch to search against the public Internet or psearch to search against your private index. 
    # You can also use cpsearch to search against both the Internet and your private index, for the cost of two search credits.
    # Text encoding (e): Use an IANA name, such as UTF-8 (Unicode), ISO-8859-1 (Latin-1) or WINDOWS-1251 (Cyrillic).
    # Text to be searched (t): If you are using the Raw POST method, as described above, the raw text should be supplied 
    # in the POST payload without a parameter name and without any urlencoding.
    # Full comparisons (c): Set to a value between 1 and 10 to request a full text-on-text comparison 
    # (with an exact count of matching words) between the query text and the top (one to ten) results found. 
    # Note that full comparisons may add a delay of a few seconds.
    # Response format (f): If omitted or set to xml, the API will respond in XML. 
    # If set to html, the API will respond in basic HTML.
    # Example test (x): If set to 1, the API will search the Internet for copies of the text on this page and 
    # you will not be charged.
    #
    def base_params
      raise "You must set Copyscape.username" unless Copyscape.username
      raise "You must set Copyscape.api_key" unless Copyscape.api_key
      {
        :u => Copyscape.username,
        :k => Copyscape.api_key
      }
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
