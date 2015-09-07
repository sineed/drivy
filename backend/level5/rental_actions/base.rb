module RentalActions
  class Base
    attr_reader :rental

    def initialize(rental)
      @rental = rental
    end

    def report
      {
        "who" => who,
        "type" => type,
        "amount" => amount
      }
    end
  end
end
