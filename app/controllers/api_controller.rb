class ApiController < ApplicationController
  # force_ssl
  skip_before_action :verify_authenticity_token
  # def initialize(params)
  #   @userID = params[:uid]
  # end 

  def index
    if request.post?
      userID = params[:uid]
      user = User.find_user(userID)
      if user.nil? 
        render json: ["user: does not exist"]
      else 
        render json: [user]
      end
    else
      # debugging code, remove later 
      render json: ["This is a GET response from the API. Hello!"]
    end 
  end 

  def create
    if request.post? 
    @userID = params[:uid]
      user_profile = User.create_new_account(params) 
      if user_profile.nil? 
        render json: ["status: account did not save, please try again later"]
      else 
        render json: ["status: user account has been created"]
      end
    else 
      # debugging code, remove later 
      render json: ["This is a GET response from the API. Hello!"]
    end
  end 

  def edit
    # user = User.edit_existing_account(params)
    # render json: [user]
  end 

  def photo
    user = params[:uid]
    # user = User.find_user("12345")

    render json: [user] 
    # user.dog_picture = params[:dog_picture]
    # user.dog_picture_url = user.dog_picture.url
    # user.save! 
    # render json: ["butts butts butts"] 
  end 

  def search
    # matches = User.search_for_matches(params[:location])
    # render json[matches]
  end 

end
