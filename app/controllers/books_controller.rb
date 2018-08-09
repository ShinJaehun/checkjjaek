class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @posts = Post.where(book_id: @book.id).order(created_at: :desc)

  end
  
  private
  
  def set_book
    @book = Book.find(params[:id])
  end
end
