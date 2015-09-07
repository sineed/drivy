module DiscountRule
  class Fifty < Base
    private

    def threshold_days
      10
    end

    def maximum_days
      Float::INFINITY
    end

    def discount
      0.5
    end
  end
end
