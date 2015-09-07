require "virtus"

class Rental
  include Virtus.model

  attribute :id, Integer
  attribute :car_id, Integer
  attribute :start_date, Date
  attribute :end_date, Date
  attribute :distance, Integer
  attribute :context, Object
  attribute :deductible_reduction, Boolean

  def car
    @car ||= context.cars.find { |car| car.id == car_id }
  end

  def price
    @price ||= time_price + distance_price
  end

  def days
    @days ||= (end_date - start_date + 1).to_i
  end

  def commission
    {
      "insurance_fee" => insurance_fee,
      "assistance_fee" => assistance_fee,
      "drivy_fee" => drivy_fee
    }
  end

  def options
    {
      "deductible_reduction" => deductible_price
    }
  end

  private

  def time_price
    [
      DiscountRule::Zero.new(self),
      DiscountRule::Ten.new(self),
      DiscountRule::Thirty.new(self),
      DiscountRule::Fifty.new(self),
    ].map(&:apply).inject(:+)
  end

  def distance_price
    distance * car.price_per_km
  end

  def insurance_fee
    total_fee * 0.5
  end

  def assistance_fee
    days * 100
  end

  def drivy_fee
    total_fee - insurance_fee - assistance_fee
  end

  def total_fee
    price * 0.3
  end

  def deductible_price
    deductible_reduction ? days * 400 : 0
  end
end
