class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to show
    else
      render :edit
    end
  end

  def destroy
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
