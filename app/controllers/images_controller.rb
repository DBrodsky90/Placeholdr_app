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
		if params["selected_images"] == nil
			flash[:uncheck_error] = "Please select at least one image to add to your board."
			redirect_to home_path
		else
			params["selected_images"].each do |image|
				image_obj =  Image.create(image_params(image))
				board.add_image(image_obj)
			end
			redirect_to board_path(board)
		end
	end

	def destroy
		board = Board.find(params[:id])
		if params["selected_images"] == nil
			redirect_to board_path(board)
		else
			params["selected_images"].each do |image|
				img = Image.find(image)
				img.destroy
			end
			redirect_to board_path(board)
		end
	end

	private

	def image_params(image_name)
		params.require(image_name).permit(:title, :imgurl, :width, :height, :filesize)
	end

end