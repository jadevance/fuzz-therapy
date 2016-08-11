class User < ApplicationRecord

  def self.find_user(uid) 
    user = self.find_by(uid: auth_hash['info']['uid'])
    # if !user.nil?
    return user
  end 

  def self.create_new_user(auth_hash)
      user                  = User.new 
      user.uid              = auth_hash.uid
      user.name             = auth_hash.info.name
      user.location         = auth_hash.info.image 
      user.availability     = auth_hash.info.image 
      user.dog_breed        = auth_hash.info.dog_breed
      user.dog_name         = auth_hash.info.dog_name
      user.dog_age          = auth_hash.info.dog_age
      user.dog_picture      = auth_hash.info.dog_picture
      user.save!
      
    if user.save
      return user
    else
      return nil
    end
  end 
end
