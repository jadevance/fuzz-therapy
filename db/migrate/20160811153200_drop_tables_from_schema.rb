class DropTablesFromSchema < ActiveRecord::Migration[5.0]
  def change
    drop_table :dogs
    drop_table :logs
    change_column_null :users, :dog_name, false 
    change_column_null :users, :dog_picture, false 
  end
end
