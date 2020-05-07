class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:buyer, :seller]
  has_many :products , dependent: :destroy
  has_many :carts , dependent: :destroy
  has_many :orders , dependent: :destroy
  has_many :checkouts , dependent: :destroy
  has_one :store , dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# :admin,