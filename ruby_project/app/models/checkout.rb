class Checkout < ApplicationRecord
	belongs_to :user
	belongs_to :product
	belongs_to :order
	belongs_to :cart

	# validate :quantity

	# private

	# def quantity_test
	# 	if quantity > available
	# 		errors.add(:quantity , "sorry not available" )
	# 	elsif quantity < 1
	# 		errors.add(:quantity, "Should me one or more of this product")	
	# 	end	
	# end
end
