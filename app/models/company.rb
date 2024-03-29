class Company < ActiveRecord::Base
  belongs_to :user,        inverse_of: :companies
  has_many   :products,    inverse_of: :company, dependent: :destroy
  has_many   :stock_items, inverse_of: :company, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }

  attr_accessible :name

  def product_names
    products.map(&:name)
  end
end
