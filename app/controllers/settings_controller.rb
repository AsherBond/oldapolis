class SettingsController < ApplicationController 
	def edit

	end

	def customize
		@user = current_user
	end

	def update
	  if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated"
		sign_in @user
		redirect_to @user
	  else
	  	error_message = "Please review your information."
		render 'edit'
	  end
	end
end