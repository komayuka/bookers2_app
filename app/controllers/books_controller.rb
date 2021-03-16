class BooksController < ApplicationController

  def new
     @book = Book.new(book_params)
  end


  def index
   @book = Book.all
  end

  def show
    @book = Book.find(params[:id])

  end

  def create
     @book = Book.new(book_params)
     if @book.save
       redirect_to book_path(@books), notice: 'You have created book successfully'
     else
       render :show
     end
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

  end
