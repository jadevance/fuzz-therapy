class User < ApplicationRecord

  def self.find_user(uid) 
    user = self.find_by(uid: auth_hash['user']['uid'])
    return user
  end 

  def self.create_new_user(auth_hash)
      user                  = User.new 
      user.uid              = auth_hash.uid
      user.name             = auth_hash.name
      user.location         = auth_hash.image 
      user.availability     = auth_hash.image 
      user.dog_breed        = auth_hash.dog_breed
      user.dog_name         = auth_hash.dog_name
      user.dog_age          = auth_hash.dog_age
      user.dog_picture      = auth_hash.dog_picture
      user.save!
      
    if user.save
      return user
    else
      return nil
    end
  end 
end

    # t.datetime "created_at",   null: false
    # t.datetime "updated_at",   null: false
    # t.string   "name",         null: false
    # t.string   "location",     null: false
    # t.string   "availability", null: false
    # t.string   "uid",          null: false
    # t.string   "dog_name",     null: false
    # t.integer  "dog_age"
    # t.string   "dog_breed"
    # t.string   "dog_picture",  null: false
