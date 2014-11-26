class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations
  
  scope :private_wiki, -> { where(private: true) }
  scope :public_wiki, -> { where(private: false) }
end
