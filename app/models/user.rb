class User < ApplicationRecord

  def self.find_user(uid) 
    user = User.find_by(uid: uid)
    if !user.nil?
      return user
    else 
      return nil
    end 
  end 

  def self.create_new_account(auth_hash)
      user               = User.new 
      user.uid           = auth_hash["user"]["uid"]
      user.name          = auth_hash["user"]["name"]
      user.location      = auth_hash["user"]["location"]
      user.availability  = auth_hash["user"]["availability"]
      user.dog_breed     = auth_hash["user"]["dog_breed"]
      user.dog_name      = auth_hash["user"]["dog_name"]
      user.dog_age       = auth_hash["user"]["dog_age"]
      # before action: picture url from S3
      # insert it into the PG database 
      user.dog_picture   = auth_hash["user"]["dog_picture"]
      user.save!
      
    if user.save
      return user
    else
      return nil
    end
  end 
end





