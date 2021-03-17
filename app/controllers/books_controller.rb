class BooksController < ApplicationController

  def new
     @book = Book.new(book_params)
  end


  def index
   @books = Book.all
   @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
     @book = Book.new(book_params)
     if @book.save
       redirect_to book_path(@book)
     else
       @books = Book.all
       render :show
     end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render_to book_path(@book)
    else
      render action: :edit
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
end