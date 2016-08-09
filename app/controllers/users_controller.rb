class UsersController < ApplicationController
  config.force_ssl = true

  def create
    if request.post?
      @user = User.find(:api_token => params[:api_authtoken]).first
    
    render :json [@user]
    end
  end

  private 
  # searches based on location here ? 
end
