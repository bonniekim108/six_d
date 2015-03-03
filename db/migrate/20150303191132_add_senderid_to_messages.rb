class AddSenderidToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :senderid, :integer
  end
end
