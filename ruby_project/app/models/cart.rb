class Cart < ApplicationRecord
	 belongs_to :user
     has_many :checkouts , dependent: :destroy

end
