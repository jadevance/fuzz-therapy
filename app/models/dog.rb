class Dog < ApplicationRecord
  belongs_to :user
  
  def self.create_profile
    dog = Dog.new
    dog.dog_breed         = auth_hash.info.dog_breed
    dog.dog_name          = auth_hash.info.dog_name
    dog.dog_age           = auth_hash.info.dog_age
    dog.dog_picture       = auth_hash.info.dog_picture
    dog.save!
  end
end