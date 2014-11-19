class BoardsController < ApplicationController

	before_action :authenticate

	def index
		@boards = Board.all
	end

	def show
		@board = Board.find(params[:id])
	end

	def new 
		@board = Board.new
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
			redirect_to edit_board_path
		end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy
		redirect_to @board
	end

	private

	def board_params
		params.require(:entry).permit(:name, :theme, :public, :user)
	end
end