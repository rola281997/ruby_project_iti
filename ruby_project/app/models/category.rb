class Category < ApplicationRecord
	has_many :products , dependent: :destroy
	validates :name, presence: true,
	length: { minimum: 3 }

end
