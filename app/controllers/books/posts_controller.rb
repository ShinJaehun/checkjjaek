class Books::PostsController < PostsController
  before_action :set_postable


  private

    def set_postable
      @postable = Book.find(params[:book_id])
    end
end