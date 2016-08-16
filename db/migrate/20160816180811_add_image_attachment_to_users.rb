class AddImageAttachmentToUsers < ActiveRecord::Migration[5.0]
  def change
      remove_column :users, :dog_image
  end

  def self.up
    add_attachment :users, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
