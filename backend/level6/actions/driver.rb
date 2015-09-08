module Actions
  class Driver < Base
    def who
      "driver"
    end

    def type
      amount > 0 ? "debit" : "credit"
    end

    def amount
      rental.price + rental.deductible_price
    end
  end
end
