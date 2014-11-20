class Wiki < ActiveRecord::Base
  belongs_to :user
  
  scope :private_wiki, -> { where(private: true) }
  scope :public_wiki, -> { where(private: false) }
end
