class Product < ApplicationRecord

	validates :name,presence: true


	def self.cover_products
		self.where(is_cover: true)
	end

end
