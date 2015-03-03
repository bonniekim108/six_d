class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :body
      t.string :sender
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :messages, :users
  end
end
