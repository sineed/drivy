module RentalActions
  class Assistance < Base
    def who
      "assistance"
    end

    def type
      "credit"
    end

    def amount
      rental.assistance_fee
    end
  end
end
