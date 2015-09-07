module DiscountRule
  class Thirty < Base
    private

    def threshold_days
      4
    end

    def maximum_days
      6
    end

    def discount
      0.7
    end
  end
end
