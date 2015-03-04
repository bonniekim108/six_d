class AddUserFullNameToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :user_full_name, :string
  end
end
