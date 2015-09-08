require_relative "actions"

module RentalModificationActions
  def self.report(rental_modifications)
    {
      "rental_modifications" => rental_modifications.map { |rental_modification|
        {
          "id" => rental_modification.id,
          "rental_id" => rental_modification.rental_id,
          "actions" => Actions.generate(rental_modification)
        }
      }
    }
  end
end
