class Image < ActiveRecord::Base

	has_and_belongs_to_many :boards

	validates_presence_of :title, :imgurl, :width, :height, :filesize

end