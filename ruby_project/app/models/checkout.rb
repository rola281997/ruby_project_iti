class Checkout < ApplicationRecord
	belongs_to :user
	belongs_to :product
	belongs_to :order
	belongs_to :cart

end
