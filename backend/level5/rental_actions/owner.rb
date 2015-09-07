module RentalActions
  class Owner < Base
    def who
      "owner"
    end

    def type
      "credit"
    end

    def amount
      rental.price - rental.total_fee
    end
  end
end
