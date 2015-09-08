module Actions
  class Assistance < Base
    def who
      "assistance"
    end

    def type
      amount > 0 ? "credit" : "debit"
    end

    def amount
      rental.assistance_fee
    end
  end
end
