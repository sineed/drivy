module RentalActions
  class Insurance < Base
    def who
      "insurance"
    end

    def type
      "credit"
    end

    def amount
      rental.insurance_fee
    end
  end
end
