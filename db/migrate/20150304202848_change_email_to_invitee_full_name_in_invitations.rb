class ChangeEmailToInviteeFullNameInInvitations < ActiveRecord::Migration
  def change
    rename_column :invitations, :email, :invitee_full_name
    
  end
end
