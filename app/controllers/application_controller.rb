class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    cookies.signed[:user] == ENV["TAPAS_APP_USER"]
  end
end
