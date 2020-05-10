class Order < ApplicationRecord
  enum state: [:created, :pending, :confirmed, :delivered]
	belongs_to :user
    has_many :checkouts , dependent: :destroy

end
