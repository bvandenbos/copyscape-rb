# More info here http://www.copyscape.com/api-guide.php
#
require 'nokogiri'

module Copyscape
  
  class Response

    attr_reader :raw_response

    def initialize(buffer)
      @raw_response = buffer
      @document = Nokogiri(buffer)
    end
    
    # URL searched
    # Presert: if a URL search
    # The <query> value may differ from the original URL you supplied if there was a frameset or redirection.
    #
    def query
      field('query')
    end
    
    # Number of words checked
    def query_words
      (field('querywords') || 0).to_i
    end
  
    # Returns the number of duplicates
    def count
      (field('count') || 0).to_i
    end
    
    # Returns true if the response was an error
    def error?
      !!error
    end
    
    # Reason for API request failure
    # Present: if request failed
    #
    def error
      field('error')
    end

    # Number of source words matched
    # Present: if succeeded and c>=3 and o is not cpsearch
    #
    def allwordsmatched
      (field('allwordsmatched') || 0).to_i
    end

    # Percentage of source words matched
    # Present: if succeeded and c>=3 and o is not cpsearch
    #
    def allpercentmatched
      (field('allpercentmatched') || 0).to_i
    end

    # Full extract of source text matched
    # Present: if succeeded and c>=3 and o is not cpsearch
    #
    def alltextmatched
      field('alltextmatched')
    end

    # URL for viewing found results
    # Present: if succeeded and o is csearch
    # The <allviewurl> value can be used to display the list of results in an iframe or window. 
    # If used, the contents of this page must be displayed in full, without modification.
    #
    def allviewurl
      field('allviewurl')
    end
  
    # Returns true if there are one or more duplicates
    def duplicate?
      count > 0
    end
  
    # Returns an array of all the results in the form of a hash:
    def duplicates
      @duplicates ||= [].tap do |r|
        @document.search('result').collect do |result|
          r << result_to_hash(result)
        end
      end
    end
    
    private
    
    # Given a result xml element, return a hash of the values we're interested in.
    def result_to_hash(result)
      result.children.inject({}) do |hash, node|
        hash[node.name] = (node.text =~ /^\d+$/ ? node.text.to_i : node.text)
        hash
      end
    end
    
    def field(name)
      node = @document.search(name).first
      node.text if node
    end
    
  end
  
end