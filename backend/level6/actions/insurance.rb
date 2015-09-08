module Actions
  class Insurance < Base
    def who
      "insurance"
    end

    def type
      amount > 0 ? "credit" : "debit"
    end

    def amount
      rental.insurance_fee
    end
  end
end
