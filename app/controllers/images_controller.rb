class ImagesController < ApplicationController

	def index
		@images = BingWrapper.search(params[:search])
		@short_urls = @images.map do |image|
			BitlyWrapper.short(image[:MediaUrl])
		end
		if session[:current_user_id]
			@boards = User.find(session[:current_user_id]).boards
		end
	end

	def show
		@image = Image.find(params[:id])
		@short_url = BitlyWrapper.short(@image.imgurl)
	end

	def create
		board = Board.find(params[:board_id])
		params["selected_images"].each do |image|
			image_obj =  Image.create(image_params(image))
			board.add_image(image_obj)
		end
		redirect_to board_path(board)
	end

	def destroy
		board = Board.find(params[:id])
		params["selected_images"].each do |image|
			img = Image.find(image)
			img.destroy
		end
		redirect_to board_path(board)
	end

	private

	def image_params(image_name)
		params.require(image_name).permit(:title, :imgurl, :width, :height, :filesize)
	end

end