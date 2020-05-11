class Product < ApplicationRecord
	belongs_to :brand
	belongs_to :category
	belongs_to :user
	has_many :checkouts , dependent: :destroy
	has_one_attached :image
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true  ,:numericality => { greater_than_or_equal_to: 0 }
	validates :inStock_amount, presence: true  ,:numericality => { greater_than_or_equal_to: 0 }
	validates :image, presence: true	

	scope :filter_by_brand, -> (brand) { where brand: brand }
	scope :filter_by_category, -> (category) { where category: category }
	scope :filter_by_seller, -> (seller) { where user: seller }

end
