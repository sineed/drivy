require "minitest/autorun"
require_relative "main"

class TestLevel3 < MiniTest::Test
  def setup
    @level3 = Level3.new
  end

  def test_rental_prices
    assert_equal expected_json, @level3.rental_prices
  end

  private

  def expected_json
    JsonParser.new(File.dirname(__FILE__), "output.json").parse
  end
end
