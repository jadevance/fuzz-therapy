class User < ApplicationRecord
  has_attached_file :dog_picture
  validates_attachment_content_type :dog_picture, :content_type => 
  ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # # After initialization, set default values
  # after_initialize :set_default_values
  
  # def set_default_values
  #   # Only set if dog_picture IS NOT set
  #   self.dog_picture ||= "http://i.imgur.com/d2EwLHX.jpg"
  # end

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
    # location = auth_hash["location"]
    # matches =  []
    # matches << User.fuzzy_search(location: location)
    # if matches != nil 
    #   return matches
    # else 
    #   return "No matches found"
    # end
  end

  def self.edit_existing_account(auth_hash)
    #   uid                = auth_hash["uid"]
    #   user               = User.find_by(uid: uid)
    #   user.name          = auth_hash["name"]
    #   user.location      = auth_hash["location"]
    #   user.availability  = auth_hash["availability"]
    #   user.dog_breed     = auth_hash["dog_breed"]
    #   user.dog_name      = auth_hash["dog_name"]
    #   user.dog_age       = auth_hash["dog_age"]
    #   user.save!
      
    # if user.save
    #   return user
    # else
    #   return "Unable to update account, please try again"
    # end
  end 

end





