class AddUserEmailToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :user_email, :string
  end
end
