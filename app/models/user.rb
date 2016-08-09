class User < ApplicationRecord
  has_many :dogs
  has_many :logs   
  def create_new_user(api_token)
    user = self.find_by(uid: auth_hash['info']['uid'], provider: auth_hash['provider'])
    if !user.nil?
      return user
    else
        user                  = User.new 
        user.provider         = auth_hash.provider
        user.uid              = auth_hash.uid
        user.name             = auth_hash.info.name
        user.image            = auth_hash.info.image 
        user.oauth_token      = auth_hash.credentials.token
        user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
        user.save!
      if user.save
        return user
      else
        return nil
      end
    end
  end 
end
