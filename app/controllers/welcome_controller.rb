class WelcomeController < ApplicationController
  # force_ssl
  
  def index
    render json: ["hello, world!! Dogs are best."]
  end
end
