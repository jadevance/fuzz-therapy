class RemoveColumn < ActiveRecord::Migration[5.0]
  def change 
    remove_column :users, :dog_file_name
    remove_column :users, :dog_content_type
    remove_column :users, :dog_file_size
    remove_column :users, :dog_updated_at
    remove_column :users, :dog_picture
  end
  def self.up
    add_attachment :users, :dog_picture
  end

  def self.down
    remove_attachment :users, :dog_picture
  end
end
