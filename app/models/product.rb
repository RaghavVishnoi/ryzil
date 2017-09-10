class Product < ApplicationRecord

	mount_uploader :product_image, ProductImageUploader

	validates :name,presence: true


	def self.cover_products
		self.where(is_cover: true)
	end

end
