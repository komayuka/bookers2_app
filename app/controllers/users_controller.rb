class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

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
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "error"
      render :edit
    end
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

def ensure_correct_user
  @user = User.find(params[:id])
if @user.id != current_user.id
  redirect_to user_path(current_user.id)
end
end

end
