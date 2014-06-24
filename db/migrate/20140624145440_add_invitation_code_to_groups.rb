class AddInvitationCodeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :invitation_code, :string
  end
end
