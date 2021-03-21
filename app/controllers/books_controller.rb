class BooksController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update, :destroy]

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
     @book_new = Book.new
     if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
     else
       @books = Book.all
       flash.now[:danger] = "error"
         render "index"
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
      flash.now[:danger] = "error"
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
      @book = Book.find(params[:id])
   if @book.user_id != current_user.id
        redirect_to books_path
   end
  end

end