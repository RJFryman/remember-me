class UsersController < ApplicationController
  expose(:user)

  def update
    user_params = params.require(:user).permit(:name, :email, :phone, :website,:company, :linkedin, :github, :twitter, :address, :city, :state, :zip)
    if current_user.update_attributes(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to current_user
    else
      flash.alert = "Your profile could not be updated."
      render :edit
    end
  end
end
