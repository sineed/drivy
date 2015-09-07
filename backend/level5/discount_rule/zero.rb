module DiscountRule
  class Zero < Base
    def apply
      rental.car.price_per_day
    end
  end
end
