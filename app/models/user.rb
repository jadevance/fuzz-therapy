class User < ApplicationRecord
  has_attached_file :dog_picture
  validates_attachment_content_type :dog_picture, :content_type => 
  ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.create_new_account(auth_hash)
      user               = User.new 
      user.uid           = auth_hash["uid"]
      user.name          = auth_hash["name"]
      user.location      = auth_hash["location"]
      user.availability  = auth_hash["availability"]
      user.dog_breed     = auth_hash["dog_breed"]
      user.dog_name      = auth_hash["dog_name"]
      user.dog_age       = auth_hash["dog_age"]
      user.save!
      
    if user.save
      return user
    else
      return "Unable to create account, please try again"
    end
  end 

  def self.search_for_matches(user_location)
    matches = Array.new
    matches << User.where(location: user_location).limit(10)
    if matches != nil 
      return matches
    else 
      return "No matches found"
    end
  end

  def self.edit_existing_account(auth_hash)
      uid                = auth_hash["uid"]
      user               = User.find_by(uid: uid)
      user.name          = auth_hash["name"]
      user.location      = auth_hash["location"]
      user.availability  = auth_hash["availability"]
      user.dog_breed     = auth_hash["dog_breed"]
      user.dog_name      = auth_hash["dog_name"]
      user.dog_age       = auth_hash["dog_age"]
      user.save!
      
    if user.save
      return user
    else
      return "Unable to update account, please try again"
    end
  end 

  # def self.update_dog_url(user)

  # end 

end





