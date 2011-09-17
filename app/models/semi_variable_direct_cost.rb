class SemiVariableDirectCost < DirectCost
  validates :fixed_cost_price,    presence: true, numericality: { greater_than: 0 }
  validates :variable_cost_price, presence: true, numericality: { greater_than: 0 }

  attr_accessible :fixed_cost_price, :variable_cost_price
end
