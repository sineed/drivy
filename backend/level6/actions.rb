require_relative "actions/base"
require_relative "actions/driver"
require_relative "actions/owner"
require_relative "actions/insurance"
require_relative "actions/assistance"
require_relative "actions/drivy"

module Actions
  def self.generate(object)
    [
      Actions::Driver.new(object),
      Actions::Owner.new(object),
      Actions::Insurance.new(object),
      Actions::Assistance.new(object),
      Actions::Drivy.new(object)
    ].map(&:report)
  end
end
