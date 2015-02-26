class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :invited_by
      t.string :email
      t.datetime :sent_at

      t.timestamps null: false
    end
  end
end
