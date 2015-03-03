class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :invitee_id
      t.timestamps
    end

    add_index :friendships, [:user_id, :invitee_id]
  end
end
