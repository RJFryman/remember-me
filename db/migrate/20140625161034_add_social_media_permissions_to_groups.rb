class AddSocialMediaPermissionsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :github, :boolean
    add_column :groups, :company, :boolean
    add_column :groups, :twitter, :boolean
    add_column :groups, :linkedin, :boolean
  end
end
