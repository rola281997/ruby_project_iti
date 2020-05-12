class Cart < ApplicationRecord
	 belongs_to :user
     has_many :checkouts , dependent: :destroy

	# validates :quantity, presence: true  , :numericality => { greater_than_or_equal_to: 1 }

	
end
