class SessionsController < ApplicationController

	def new
		if session[:current_user_id]
			redirect_to home_path
		end
	end

	def create
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			session[:current_user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:login_error] = "That username password combo does not match our records. Please try again, sign-up, or continue as guest."
			render :new
		end
	end

	def destroy
		session[:current_user_id] = nil
		flash[:logout] = "You have successfully logged out"
		redirect_to root_url
	end
end
