require File.dirname(__FILE__) + '/test_helper'

describe Copyscape::Balance do

  describe "request balance in xml" do
    before do
      Copyscape::Balance.expects(:get).once.returns(balance_response_duplicate(:xml))
      @balance = Copyscape::Balance.new(:xml)
    end

    it "has the correct url" do
      assert_match raw_response_duplicate(:xml), @balance.raw_response
    end
  end

  describe "request balance in html" do
    before do
      Copyscape::Balance.expects(:get).once.returns(balance_response_duplicate(:html))
      @balance = Copyscape::Balance.new(:html)
    end

    it "has the correct url" do
      assert_match raw_response_duplicate(:html), @balance.raw_response
    end
  end

  private

  def balance_response_duplicate(format)
    o = Object.new
    o.stubs(:body).returns(File.read(File.expand_path("../balance.#{format.to_s}", __FILE__)))
    o
  end

  def raw_response_duplicate(format)
    balance_response_duplicate(format).body
  end
end
