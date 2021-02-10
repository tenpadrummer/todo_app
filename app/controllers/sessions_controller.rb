class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid email or password!"
      render "new"
    end
  end
end
