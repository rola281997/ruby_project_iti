class Order < ApplicationRecord
  enum state: [:pending, :confirmed, :delivered]
	belongs_to :user
    has_many :checkouts , dependent: :destroy

end
