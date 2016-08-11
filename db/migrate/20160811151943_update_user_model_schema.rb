class UpdateUserModelSchema < ActiveRecord::Migration[5.0]
    change_table :users do |t|
      t.string :dog_name
      t.integer :dog_age
      t.string :dog_breed
      t.string :dog_picture
    end 

    remove_column :users, :provider
    remove_column :users, :oauth_token
    remove_column :users, :oauth_expires_at
end