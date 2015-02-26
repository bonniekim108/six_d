class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :first_name
      t.text :content
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
