module Actions
  class Base
    attr_reader :rental

    def initialize(rental)
      @rental = rental
    end

    def report
      {
        "who" => who,
        "type" => type,
        "amount" => display_amount
      }
    end

    def display_amount
      amount.abs
    end
  end
end
