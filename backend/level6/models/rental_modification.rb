require "virtus"

class RentalModification
  include Virtus.model

  attribute :id, Integer
  attribute :rental_id, Integer
  attribute :start_date, Date
  attribute :end_date, Date
  attribute :distance, Integer
  attribute :context, Object

  def rental
    @rental ||= context.rentals.find { |rental| rental.id == rental_id }
  end

  def modified_rental
    @modified_rental ||= begin
      present_attributes = attributes.select do |k, v|
        [:start_date, :end_date, :distance].include?(k) && !v.nil?
      end
      Rental.new(rental.attributes.merge(present_attributes))
    end
  end

  def price
    modified_rental.price - rental.price
  end

  def deductible_price
    modified_rental.deductible_price - rental.deductible_price
  end

  def total_fee
    modified_rental.total_fee - rental.total_fee
  end

  def insurance_fee
    modified_rental.insurance_fee - rental.insurance_fee
  end

  def assistance_fee
    modified_rental.assistance_fee - rental.assistance_fee
  end

  def drivy_fee
    modified_rental.drivy_fee - rental.drivy_fee
  end
end
