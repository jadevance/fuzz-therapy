class AddDogPictureColumn < ActiveRecord::Migration[5.0]
  def change 
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
    remove_column :users, :dog_picture
  end
  def self.up
    add_attachment :users, :dog_picture
  end

  def self.down
    remove_attachment :users, :dog_picture
  end
end