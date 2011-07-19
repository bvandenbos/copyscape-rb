require 'nokogiri'

module Copyscape
  
  class Response

    attr_reader :raw_response

    def initialize(buffer)
      @raw_response = buffer
      @document = Nokogiri(buffer)
    end
    
    def query
      field('query')
    end
    
    def query_words
      query_words = field('querywords')
      query_words.to_i if query_words
    end
  
    # Returns the number of duplicates
    def count
      count = field('count')
      count.to_i
    end
    
    # Returns true if the response was an error
    def error?
      !!error
    end
    
    def error
      field('error')
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
        hash[node.name] = node.text
        hash[node.name] = node.text.to_i if node.text && node.text =~ /^\d+$/
        hash
      end
    end
    
    def field(name)
      node = @document.search(name).first
      node.text if node
    end
    
  end
  
end