class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :dog_name, null: false
      t.integer :dog_age
      t.string :dog_breed
      t.string :dog_picture, null: false
      t.timestamps
    end
  end
end
