require_relative "rental_actions/base"
require_relative "rental_actions/driver"
require_relative "rental_actions/owner"
require_relative "rental_actions/insurance"
require_relative "rental_actions/assistance"
require_relative "rental_actions/drivy"

module RentalActions
  def self.report(rentals)
    {
      "rentals" => rentals.map { |rental|
        {
          "id" => rental.id,
          "actions" => [
            Driver.new(rental),
            Owner.new(rental),
            Insurance.new(rental),
            Assistance.new(rental),
            Drivy.new(rental)
          ].map(&:report)
        }
      }
    }
  end
end
