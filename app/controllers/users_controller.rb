class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.image = "no_image.jpeg"
     if @user.save
       redirect_to pasts_path, notice: 'You have update user successfully'
     else
       render :show
     end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to action: 'show'
  end

  def destroy
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
