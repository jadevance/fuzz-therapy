class AddDogPictureUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :dog_picture_url
    end 
  end 
end
