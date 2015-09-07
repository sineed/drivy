module DiscountRule
  class Base
    attr_reader :rental
    def initialize(rental)
      @rental = rental
    end

    def apply
      if rental.days > threshold_days
        [(rental.days - threshold_days), maximum_days].min *
        discount *
        rental.car.price_per_day
      else
        0
      end
    end
  end
end
