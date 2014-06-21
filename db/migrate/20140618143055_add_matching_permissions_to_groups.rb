class AddMatchingPermissionsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :description, :string
    add_column :groups, :phone, :boolean
    add_column :groups, :email, :boolean
    add_column :groups, :website, :boolean
    add_column :groups, :address, :boolean
    add_column :groups, :city, :boolean
    add_column :groups, :state, :boolean
    add_column :groups, :zip, :boolean
  end
end
