class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user_id = current_user.id
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book_data = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.user_id = current_user.id
    if @user.update(user_params)
      redirect_to user_path(@user.user_id)
    else
      rendre action: :edit
    end
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
