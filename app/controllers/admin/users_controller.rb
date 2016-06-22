class Admin::UsersController < ApplicationController
  before_filter :only_allow_admin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      binding.pry
      redirect_to admin_users_path, notice: "You have successfully created #{@user.full_name}"
    else
      render :'admin/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path(@user), notice: "#{@user.full_name} has been successfully updated"
    else
      render :'admin/users/edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "That fool was successfully taken care of..."
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end
end
