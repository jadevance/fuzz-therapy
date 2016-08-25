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
      user.email         = auth_hash["email"]
      user.save!
  end 

  def self.search_for_matches(user_location)
    matches = Array.new
    matches << User.where(location: user_location).limit(15)
    if matches != nil 
      return matches.flatten!
    end
  end

  def self.edit_existing_account(auth_hash)
    user = User.find_by(uid: auth_hash[:uid]) 
    user.name          = auth_hash["name"]
    user.location      = auth_hash["location"]
    user.availability  = auth_hash["availability"]
    user.dog_breed     = auth_hash["dog_breed"]
    user.dog_name      = auth_hash["dog_name"]
    user.dog_age       = auth_hash["dog_age"]
    user.save
    if user.save
      return user
    end
  end 
end