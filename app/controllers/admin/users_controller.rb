class Admin::UsersController < ApplicationController
  before_filter :only_allow_admin

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
