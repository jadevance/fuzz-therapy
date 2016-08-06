class Dog < ApplicationRecord
  t.string :dog_name, null: false
  t.integer :dog_age
  t.string :dog_breed
  t.string :dog_picture, null: false
end
