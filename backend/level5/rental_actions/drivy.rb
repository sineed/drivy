module RentalActions
  class Drivy < Base
    def who
      "drivy"
    end

    def type
      "credit"
    end

    def amount
      rental.drivy_fee + rental.deductible_price
    end
  end
end
