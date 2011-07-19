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
      url = result.search('url')
      title = result.search('title')
      text_snippet = result.search('textsnippet')
      html_snippet = result.search('htmlsnippet')
      min_words_matched = result.search('minwordsmatched')
      url_words = result.search('urlwords')
      words_matched = result.search('wordsmatched')
      text_matched = result.search('textmatched')
      url_error = result.search('urlerror')
      
      r = {}
      r[:url] = url.text if url
      r[:title] = title.text if title
      r[:text_snippet] = text_snippet.text if text_snippet
      r[:html_snippet] = html_snippet.text if html_snippet
      r[:min_words_matched] = min_words_matched.text.to_i if min_words_matched
      r[:url_words] = url_words.text if url_words
      r[:words_matched] = words_matched.text.to_i if words_matched
      r[:text_matched] = text_matched.text if text_matched
      r[:url_errors] = url_error.text if url_error
      r
    end
    
    def field(name)
      node = @document.search(name).first
      node.text if node
    end
    
  end
  
end