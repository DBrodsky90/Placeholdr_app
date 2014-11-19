class Board < ActiveRecord::Base
	has_and_belongs_to_many :images
	belongs_to :user

	validates :name, :theme, :public, :user, presence: true
end