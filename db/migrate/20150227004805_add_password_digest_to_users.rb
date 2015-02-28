class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :password, :string
    remove_column :users, :password_confirmation, :string
    add_column :users, :username, :string
  end
end
