class Product < ApplicationRecord
	 belongs_to :brand
	 belongs_to :category
	 belongs_to :user
     has_many :checkouts , dependent: :destroy

end
