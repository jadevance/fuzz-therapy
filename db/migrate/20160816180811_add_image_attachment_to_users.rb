class AddImageAttachmentToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :users, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
