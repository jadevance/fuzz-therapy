class ApiController < ApplicationController
  # force_ssl
  skip_before_action :verify_authenticity_token
  # http_basic_authenticate_with name:ENV["API_AUTH_NAME"], password:ENV["API_AUTH_PASSWORD"]

  def index
    if request.post?
      user = User.find_by(uid: params[:uid])
      if user.nil? 
        render json: ["user: does not exist"]
      else 
        render json: [user]
      end
    end 
  end 

  def create
    if request.post? 
      user_profile = User.create_new_account(params) 
      render json: ["status: user account has been created"]
    end
  end 

  def update
    if request.put?
      user = User.edit_existing_account(params)
      render json: [user]
    end
  end 

  def photo
    uid = params[:uid]
    user = User.find_by(uid: uid)
    user.dog_picture = params[:dog_picture]
    wrong_url = user.dog_picture.url(:original)
    correct_url = wrong_url.gsub(/^http:\/\/s3.amazonaws.com\/jvance-fuzztherapy-assets/, 'jvance-fuzztherapy-assets.s3.amazonaws.com')
    user.dog_picture_url = correct_url.to_s
    user.save! 
  end 

  def search
    matches = User.search_for_matches(params[:location])
    render json: matches
  end 
end
