class DirectCost < ActiveRecord::Base
  belongs_to :product

  validates :name, presence: true, uniqueness: { scope: :product_id }

  attr_accessible :name
end
