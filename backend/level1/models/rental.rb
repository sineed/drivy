require "virtus"

class Rental
  include Virtus.model

  attribute :id, Integer
  attribute :car_id, Integer
  attribute :start_date, Date
  attribute :end_date, Date
  attribute :distance, Integer
  attribute :context, Object

  def car
    @car ||= context.cars.find { |car| car.id == car_id }
  end

  def price
    time_price + distance_price
  end

  private

  def time_price
    (end_date - start_date + 1).to_i * car.price_per_day
  end

  def distance_price
    distance * car.price_per_km
  end
end
