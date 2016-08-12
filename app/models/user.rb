class User < ApplicationRecord

  def self.find_user(uid) 
    user = self.find_by(uid: uid)
    if !user.nil?
      return user
    else 
      return nil
    end 
  end 

  def self.create_new_account(auth_hash)
      user                  = User.new 
      user.uid              = auth_hash["uid"]
      user.name             = auth_hash["name"]
      user.location         = auth_hash["location"]
      user.availability     = auth_hash["availability"]
      user.dog_breed        = auth_hash["dog_breed"]
      user.dog_name         = auth_hash["dog_name"]
      user.dog_age          = auth_hash["dog_age"]
      user.dog_picture      = auth_hash["dog_picture"]
      user.save!
      
    if user.save
      return user
    else
      return nil
    end
  end 
end





