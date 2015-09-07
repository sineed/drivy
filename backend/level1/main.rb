require_relative "../lib/json_parser"
require_relative "models/car"
require_relative "models/rental"

class Level1
  attr_reader :json, :cars, :rentals

  def initialize
    load_json
    @cars    = json["cars"].map { |c| Car.new(c) }
    @rentals = json["rentals"].map { |r| Rental.new(r.merge(context: self)) }
  end

  def rental_prices
    { "rentals" => rentals.map { |rental| { "id" => rental.id, "price" => rental.price } } }
  end

  private

  def load_json
    @json ||= JsonParser.new(File.dirname(__FILE__), "data.json").parse
  end
end
