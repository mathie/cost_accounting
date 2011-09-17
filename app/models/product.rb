class Product < ActiveRecord::Base
  belongs_to :company, inverse_of: :products

  validates :name, presence: true, uniqueness: { scope: :company_id }
  validates :net_sale_price, presence: true, numericality: { greater_than: 0 }

  attr_accessible :name, :net_sale_price
end
