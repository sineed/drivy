require "minitest/autorun"
require_relative "main"

class TestLevel6 < MiniTest::Test
  def setup
    @level6 = Level6.new
  end

  def test_rental_modification_actions
    assert_equal expected_json, @level6.rental_modification_actions
  end

  def test_rental_actions
    assert_equal expected_rental_json, @level6.rental_actions
  end

  def test_rental_prices
    assert_equal expected_price_json, @level6.rental_prices
  end

  private

  def expected_json
    JsonParser.new(File.dirname(__FILE__), "output.json").parse
  end

  def expected_rental_json
    JsonParser.new(File.dirname(__FILE__) + "/../level5","output.json").parse
  end

  def expected_price_json
    JsonParser.new(File.dirname(__FILE__) + "/../level4","output.json").parse
  end

end
