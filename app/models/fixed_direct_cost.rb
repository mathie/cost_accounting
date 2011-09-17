class FixedDirectCost < DirectCost
  validates :fixed_cost_price, presence: true, numericality: { greater_than: 0 }

  attr_accessible :fixed_cost_price

  after_initialize :default_variable_cost_price_to_zero

  private
  def default_variable_cost_price_to_zero
    self.variable_cost_price = 0
  end
end
