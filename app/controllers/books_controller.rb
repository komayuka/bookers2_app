class BooksController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit]

  def index
   @books = Book.all
   @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def create
     @book = current_user.books.new(book_params)
     @book.user_id = current_user.id
     if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
     else
       @users = User.all
       flash.now[:danger] = "error"
       render template: 'users/index'
     end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
   if @book = Book.find(params[:id])
      @book.user != current_user
        redirect_to books_path
    end
  end

end