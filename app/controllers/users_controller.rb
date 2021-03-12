class UsersController < ApplicationController

  def new
  end

  def create
  end

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end


end
