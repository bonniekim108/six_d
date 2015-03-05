class DropDocumentsTable < ActiveRecord::Migration
  def up
    drop_table :documents
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
