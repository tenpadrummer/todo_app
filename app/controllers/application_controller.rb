class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_user_path
    end
  end
end
