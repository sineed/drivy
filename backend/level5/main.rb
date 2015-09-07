require_relative "../lib/json_parser"
require_relative "models/car"
require_relative "models/rental"
require_relative "discount_rule"
require_relative "rental_actions"

class Level5
  attr_reader :json, :cars, :rentals

  def initialize
    load_json
    @cars    = json["cars"].map { |c| Car.new(c) }
    @rentals = json["rentals"].map { |r| Rental.new(r.merge(context: self)) }
  end

  def rental_prices
    {
      "rentals" => rentals.map { |rental|
        {
          "id" => rental.id,
          "price" => rental.price,
          "commission" => {
            "insurance_fee" => rental.insurance_fee,
            "assistance_fee" => rental.assistance_fee,
            "drivy_fee" => rental.drivy_fee
          },
          "options" => {
            "deductible_reduction" => rental.deductible_price
          }
        }
      }
    }
  end

  def rental_actions
    RentalActions.report(rentals)
  end

  private

  def load_json
    @json ||= JsonParser.new(File.dirname(__FILE__), "data.json").parse
  end
end
