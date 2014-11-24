class Charge < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :stripe_charge_id, presence: true
end
