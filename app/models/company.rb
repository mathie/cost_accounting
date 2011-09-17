class Company < ActiveRecord::Base
  belongs_to :user, inverse_of: :companies

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
