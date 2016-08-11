class AddColumnsToModels < ActiveRecord::Migration[5.0]
  def change
    change_table :dogs do |t|
      t.string :dog_name
      t.integer :dog_age
      t.string :dog_breed
      t.string :dog_picture
    end 

    change_table :logs do |t|
      t.string :request
      t.string :response
    end 
  end
end 