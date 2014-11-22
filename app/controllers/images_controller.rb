class ImagesController < ApplicationController

	def index
		@images = BingWrapper.search(params[:search])
		if session[:current_user_id]
			@boards = User.find(session[:current_user_id]).boards
		end
	end

	def show
		@image = Image.find(params[:id])
	end

	def create
		board = Board.find(params[:board_id])
		params["selected_images"].each do |image|
			image_obj =  Image.create(image_params(image))
			board.add_image(image_obj)
		end
		redirect_to board_path(board)
	end

	def delete
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to images_path
	end

	private

	def image_params(image_name)
		params.require(image_name).permit(:title, :imgurl, :width, :height, :filesize)
	end

end