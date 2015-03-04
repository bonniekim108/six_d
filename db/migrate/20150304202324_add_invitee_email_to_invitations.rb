class AddInviteeEmailToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :invitee_email, :string
  end
end
