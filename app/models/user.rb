class User < ApplicationRecord

  This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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
      
      # before action: picture url from S3
      # insert it into the PG database 

      user.dog_picture   = auth_hash["dog_picture"]
      user.save!
      
    if user.save
      return user
    else
      return nil
    end

    def upload_s3_photo(dog_picture_data)
      user.avatar = dog_picture_data
    end 
  end 
end





