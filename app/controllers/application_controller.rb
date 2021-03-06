class ApplicationController < ActionController::Base
  include SessionsHelper
  include TasksHelper

  def require_login
    unless logged_in?
      flash[:danger] = 'You must be logged in.'
      redirect_to new_user_path
    end
  end
end
