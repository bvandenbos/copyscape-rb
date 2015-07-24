require File.dirname(__FILE__) + '/test_helper'

describe Copyscape::Response do

  describe "response" do
    before do
      @response = Copyscape::Response.new(url_search_response_duplicate)
    end

    it "includes query" do
      assert_equal "http://www.copyscape.com/example.html", @response.query
    end

    it "includes query words" do
      assert_equal 1340, @response.query_words
    end

    it "is not an error" do
      assert !@response.error?
    end
  end

  describe "duplicate" do

    before do
      @response = Copyscape::Response.new(url_search_response_duplicate)
    end

    it "includes count" do
      assert_equal 81, @response.count
    end

    it "is a duplicate" do
      assert @response.duplicate?
    end

    it "includes duplicates" do
      dup = @response.duplicates.first
      assert_equal 'http://www.archives.gov/exhibits/charters/declaration_transcript.html', dup['url']
      assert_equal "Declaration of Independence - Transcript", dup['title']
      assert_equal "... We hold these truths to be self-evident, that all men are created equal, that   they are endowed by ... But when a long train of abuses and usurpations, pursuing invariably the same ... to pass Laws of immediate and pressing importance, unless suspended in their ... for opposing with manly firmness his invasions on the   rights of the people. ... English Laws in a neighbouring Province, establishing therein an Arbitrary   government, ... He has plundered our seas, ravaged our Coasts, burnt our towns, ... of Cruelty & perfidy scarcely paralleled in the most barbarous ages, ... He has constrained our fellow Citizens taken Captive on the high Seas to   bear ... the merciless Indian Savages, whose known rule of warfare, ... which, would inevitably interrupt our connections and correspondence. ... on   the protection of divine Providence, we mutually pledge to each other our ... ",
        dup['textsnippet']
      assert_equal "<font color=\"#777777\">... </font><font color=\"#000000\">We hold these truths to be self-evident, that all men are created equal, that   they are endowed by ... </font><font color=\"#777777\"></font><font color=\"#000000\">But when a long train of abuses and usurpations, pursuing invariably the same ... </font><font color=\"#777777\"></font><font color=\"#000000\">to pass Laws of immediate and pressing importance, unless suspended in their ... </font><font color=\"#777777\"></font><font color=\"#000000\">for opposing with manly firmness his invasions on the   rights of the people. ... </font><font color=\"#777777\"></font><font color=\"#000000\">English Laws in a neighbouring Province, establishing therein an Arbitrary   government, ... </font><font color=\"#777777\"></font><font color=\"#000000\">He has plundered our seas, ravaged our Coasts, burnt our towns, ... </font><font color=\"#777777\"></font><font color=\"#000000\">of Cruelty &amp; perfidy scarcely paralleled in the most barbarous ages, ... </font><font color=\"#777777\"></font><font color=\"#000000\">He has constrained our fellow Citizens taken Captive on the high Seas to   bear ... </font><font color=\"#777777\"></font><font color=\"#000000\">the merciless Indian Savages, whose known rule of warfare, ... </font><font color=\"#777777\"></font><font color=\"#000000\">which, would inevitably interrupt our connections and correspondence. ... </font><font color=\"#777777\"></font><font color=\"#000000\">on   the protection of divine Providence, we mutually pledge to each other our ... </font>",
        dup['htmlsnippet']
      assert_equal 134, dup['minwordsmatched']
    end

    it "has the right amount of duplicates" do
      assert_equal @response.count, @response.duplicates.length
    end

  end

  describe "not duplicate" do
    before do
      @response = Copyscape::Response.new(url_search_response_not_duplicate)
    end

    it "includes count" do
      assert_equal 0, @response.count
    end

    it "is no a duplicate" do
      assert !@response.duplicate?
    end

    it "includes duplicates" do
      assert @response.duplicates.empty?
    end

  end

  describe "error" do
    before do
      @response = Copyscape::Response.new(error_response)
    end

    it "is an error" do
      assert @response.error?
    end

    it "returns an error message" do
      assert_equal "connection failed (2) - please ensure you entered the URL correctly", @response.error
    end

  end

  private

  def url_search_response_duplicate
    File.read(File.expand_path('../url_search_response_duplicate.xml', __FILE__))
  end

  def url_search_response_not_duplicate
    File.read(File.expand_path('../url_search_response_not_duplicate.xml', __FILE__))
  end

  def error_response
    File.read(File.expand_path('../error_response.xml', __FILE__))
  end

end
