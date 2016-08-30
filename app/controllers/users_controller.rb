class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]

  def update
  	if @user.update_attributes(user_params)
  		redirect_to user_path
  	else
  		render :edit
  	end
  end

  private
	def user_params	
		params.require(:user).permit(:email, :password, :name, :gender, :description, :contact_detail, :location_description)
	end

  def set_user
  	@user = User.find(params[:id])
	end
end

