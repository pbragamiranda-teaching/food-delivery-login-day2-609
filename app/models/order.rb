class Order

  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attr = {})
    @id = attr[:id]
    @meal = attr[:meal]
    @customer = attr[:customer]
    @employee = attr[:employee]
    @delivered = attr[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

end
