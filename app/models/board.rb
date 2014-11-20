class Board < ActiveRecord::Base
	has_and_belongs_to_many :images
	belongs_to :user

	validates :name, :theme, presence: true

	def add_image(image)
		self.images.push(image)
	end

	def remove_image(image)
		self.images.destroy(image)
	end

end