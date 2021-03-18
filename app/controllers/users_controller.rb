class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.includes(:books)
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
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
