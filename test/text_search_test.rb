require File.dirname(__FILE__) + '/test_helper'

class TextSearchTest < Test::Unit::TestCase
  context "request_url" do
    should "have the correct url" do
      Copyscape::TextSearch.expects(:post).once.returns(url_search_response_duplicate).with do |path, options|
        params = options[:body]
        assert_equal '/', path
        assert_equal 'joe', params[:u]
        assert_equal '123abc', params[:k]
        assert_equal 'this is some text', params[:t]
        assert_equal 'csearch', params[:o]
        assert_equal 'UTF-8', params[:e]
      end
      @search = Copyscape::TextSearch.new('this is some text')
    end
  end

  private

  def url_search_response_duplicate
    o = Object.new
    o.stubs(:body).returns(File.read(File.expand_path('../url_search_response_duplicate.xml', __FILE__)))
    o
  end
end
