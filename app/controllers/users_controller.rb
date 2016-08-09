class UsersController < ApplicationController
  
  force_ssl

  def create
    if request.post?
      api_token = params[:api_authtoken]
      User.find_or_create_new_user(api_token)
      # if nil, return an error "unable to save, please try again later"
    render :json [@user]
    end
  end

# If there is a token in the database, return their profile info 
#  and control goes back to iOS (main page)

# If there is no token, User.new and create a new DB entry + upload a new photo to S3
# control goes back to iOS (main page)


  private 
  # params permit
  # searches based on location here ? 

end
