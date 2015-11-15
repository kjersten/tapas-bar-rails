class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]

    if username == ENV["TAPAS_APP_USER"] && password == ENV["TAPAS_APP_PASS"]
      cookies.permanent.signed[:user] = ENV["TAPAS_APP_USER"]
      redirect_to(episodes_path)
    else
      flash.now[:danger] = "Incorrect username or password"
      render "new"
    end
  end
end
