require "minitest/autorun"
require_relative "main"

class TestLevel1 < MiniTest::Test
  def setup
    @level1 = Level1.new
  end

  def test_rental_prices
    assert_equal expected_json, @level1.rental_prices
  end

  private

  def expected_json
    JsonParser.new(File.dirname(__FILE__), "output.json").parse
  end
end
