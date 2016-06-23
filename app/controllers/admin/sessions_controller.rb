class Admin::SessionsController < ApplicationController
  before_filter :only_allow_admin

  def update
    if current_admin && current_admin != current_user #switching from user back to admin
      session[:user_id] = current_admin.id
      session[:admin_id] = nil
      redirect_to movies_path, notice: "You have successfully switched back to admin account"
    else 
      puts "current_user.id: "                                             #switching from admin to a user
      puts current_user.id
      puts "params id" 
      puts params[:id]
      session[:admin_id] = current_user.id
      session[:user_id] = params[:id]
      puts "session[:user_id] after!"
      puts session[:user_id]
      redirect_to movies_path, notice: "You have successfully changed users"
    end
  end

end
