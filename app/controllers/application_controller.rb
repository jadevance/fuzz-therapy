class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to root_path
    end
  end

  def page_not_found
    e = Error.new(:status => 404, :message => "Wrong URL or HTTP method")    
    render :json => e.to_json, :status => 404
  end
end
