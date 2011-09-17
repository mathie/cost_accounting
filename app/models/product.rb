class Product < ActiveRecord::Base
  belongs_to :company, inverse_of: :products

  has_many :direct_costs, inverse_of: :product, dependent: :destroy
  has_many :fixed_direct_costs
  has_many :variable_direct_costs
  has_many :semi_variable_direct_costs


  validates :name, presence: true, uniqueness: { scope: :company_id }
  validates :net_sale_price, presence: true, numericality: { greater_than: 0 }

  attr_accessible :name, :net_sale_price
end
