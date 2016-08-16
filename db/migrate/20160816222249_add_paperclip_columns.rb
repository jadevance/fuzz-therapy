class AddPaperclipColumns < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :users, :dog_picture
  end

  def self.down
    remove_attachment :users, :dog_picture
  end
end
