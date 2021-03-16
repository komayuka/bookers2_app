class UsersController < ApplicationController

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
    if current_user == @user
      flash[:succces] = 'You have updated user successfully'
      render :index
    end
  end

  def destroy
  end

private

def user_params
  params.require(:user).permit(:name, :introduction)
end

end
