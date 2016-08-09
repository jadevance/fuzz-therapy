class User < ApplicationRecord
  has_many :dogs
  has_many :logs   

  validate  :provider_must_be_google

  # def provider_must_be_google
  #   if provider != "google_oauth2"
  #     errors.add(:provider, "provider must be google_oauth2")
  #   end
  # end

  def self.create_new_user(api_token)
    # This is not quite right, will need to adapt it based on the params available
    user = self.find_by(uid: auth_hash['info']['uid'], provider: auth_hash['provider'])
    if !user.nil?
      return user
    else
        user                  = User.new 
        user.provider         = auth_hash.provider
        user.uid              = auth_hash.uid
        user.name             = auth_hash.info.name
        user.location         = auth_hash.info.image 
        user.availability     = auth_hash.info.image 
        user.api_token        = auth_hash.credentials.token
        user.token_expires_at = Time.at(auth_hash.credentials.expires_at)
        user.save!
        
        # Dog.create_profile(user.uid)
        # Log.create_response_log
      if user.save
        return user
      else
        return nil
      end
    end
  end 
end

 #<User id: nil, created_at: nil, updated_at: nil, name: nil, location: nil, 
 # availability: nil, provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil> 
