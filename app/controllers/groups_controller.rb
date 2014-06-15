class GroupsController < ApplicationController
  expose(:group, attributes: :group_params)

  def create
    if group.save
      redirect_to group_path(group), notice: "Group successfully created."
    else
      flash.alert = "Your group couldn't be created."
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
