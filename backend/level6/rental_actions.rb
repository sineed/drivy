require_relative "actions"

module RentalActions
  def self.report(rentals)
    {
      "rentals" => rentals.map { |rental|
        {
          "id" => rental.id,
          "actions" => Actions.generate(rental)
        }
      }
    }
  end
end
