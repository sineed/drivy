module DiscountRule
  class Ten < Base
    private

    def threshold_days
      1
    end

    def maximum_days
      3
    end

    def discount
      0.9
    end
  end
end
