class VariableDirectCost < DirectCost
  validates :variable_cost_price, presence: true, numericality: { greater_than: 0 }

  attr_accessible :variable_cost_price

  after_initialize :default_fixed_cost_price_to_zero

  private
  def default_fixed_cost_price_to_zero
    self.fixed_cost_price = 0
  end
end
