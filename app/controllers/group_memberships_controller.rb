class GroupMembershipsController < ApplicationController
  expose(:group_membership)

  def create
    group = Group.where(invitation_code:params[:invitation_code])
    if group.exists?
      current_user.groups << group
      redirect_to group_path(current_user.groups.last), notice: "You have been added to #{current_user.groups.last.name}."
    else
      flash[:alert] = "You have entered an incorrect Group Key."
      redirect_to new_group_membership_path
    end
  end
end
