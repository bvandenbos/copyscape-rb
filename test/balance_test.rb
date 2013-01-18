require File.dirname(__FILE__) + '/test_helper'

class BalanceTest < Test::Unit::TestCase

  context "request balance in xml" do
    setup do
      Copyscape::Balance.expects(:get).once.returns(balance_response_duplicate(:xml))
      @balance = Copyscape::Balance.new(:xml)
    end
    
    should "have the correct url" do
      assert_match raw_response_duplicate(:xml), @balance.raw_response
    end
  end

  context "request balance in html" do
    setup do
      Copyscape::Balance.expects(:get).once.returns(balance_response_duplicate(:html))
      @balance = Copyscape::Balance.new(:html)
    end
    
    should "have the correct url" do
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