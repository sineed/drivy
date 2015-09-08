module Actions
  class Drivy < Base
    def who
      "drivy"
    end

    def type
      amount > 0 ? "credit" : "debit"
    end

    def amount
      rental.drivy_fee + rental.deductible_price
    end
  end
end
