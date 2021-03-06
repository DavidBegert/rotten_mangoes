class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def only_allow_admin
    unless (current_user && current_user.is_admin) || current_admin
      flash[:alert] = "You must be an admin to access this page"
      redirect_to movies_path
    end
  end

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    @admin ||= User.find(session[:admin_id]) if session[:admin_id]
  end

  helper_method :current_user, :current_admin
  
end
