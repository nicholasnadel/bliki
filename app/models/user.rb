class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :wikis
  
  def standard?
    role.to_sym == :standard
  end
  
  def premium?
    role.to_sym == :premium
  end
  
  def admin?
    role.to_sym == :admin
  end
  
end
