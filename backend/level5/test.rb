require "minitest/autorun"
require_relative "main"

class TestLevel5 < MiniTest::Test
  def setup
    @level5 = Level5.new
  end

  def test_rental_actions
    assert_equal expected_json, @level5.rental_actions
  end

  private

  def expected_json
    JsonParser.new(File.dirname(__FILE__), "output.json").parse
  end
end
