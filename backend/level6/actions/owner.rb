module Actions
  class Owner < Base
    def who
      "owner"
    end

    def type
      amount > 0 ? "credit" : "debit"
    end

    def amount
      rental.price - rental.total_fee
    end
  end
end
