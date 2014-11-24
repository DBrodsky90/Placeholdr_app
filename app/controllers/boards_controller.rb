class BoardsController < ApplicationController

	# before_action :authenticate

	def index
		@boards = Board.all
		# @user = current_user
	end

	def show
		@board = Board.find(params[:id])
		@user = User.find(params[:id])
		# @current_user = current_user
	end

	def new 
		if session[:current_user_id]
			@board = Board.new
		else
			redirect_to login_path
			flash[:new_board_error] = "Please login or signup in order to create a new board."
		end
	end

	def create
		@board = Board.new(board_params)
		@board.user_id = session[:current_user_id]
		if @board.save
			redirect_to @board
		else
			render :new
		end
	end

	def edit
		@board = Board.find(params[:id])
	end

	def update
		@board = Board.find(params[:id])
		if @board.update(board_params)
			redirect_to @board
		else
			render :edit
		end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy
		redirect_to @board
	end

	def add_image
		board = Board.find(params[:id])
		image = Image.find(params[:image_id])
		board.add_image(image)
		redirect_to board_path(board)
	end

	def remove_image
		board = Board.find(params[:id])
		image = Image.find(params[:image_id])
		board.remove_image(image)
		redirect_to board_path(board)
	end

	private

	def board_params
		params.require(:board).permit(:name, :theme, :public, :user)
	end
end