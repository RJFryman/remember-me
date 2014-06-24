class GroupsController < ApplicationController
  expose(:group, attributes: :group_params)

  def create
    if group.save
      current_user.groups << group
      redirect_to group_path(group), notice: "Group successfully created."
    else
      flash.alert = "Your group couldn't be created."
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name,:invitation_code, :description, :phone, :email, :website, :address, :city, :state, :zip)
  end
end
