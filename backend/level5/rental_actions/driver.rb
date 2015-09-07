module RentalActions
  class Driver < Base
    def who
      "driver"
    end

    def type
      "debit"
    end

    def amount
      rental.price + rental.deductible_price
    end
  end
end
