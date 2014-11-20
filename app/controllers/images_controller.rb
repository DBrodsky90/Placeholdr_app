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
		@image = Image.create(image_params)
		board = Board.find(params[:board_id])
		board.add_image(@image)
		redirect_to board_path(board)
	end

	def delete
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to images_path
	end

	private

	def image_params
		params.require(:image).permit(:title, :imgurl, :width, :height, :filesize)
	end

end