class WelcomeController < ApplicationController
  config.force_ssl = true
  
  def index
    render json: ["hello, world!!"]
  end
end
