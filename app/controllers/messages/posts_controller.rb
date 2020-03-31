class Messages::PostsController < PostsController
  before_action :set_postable


  private

    def set_postable
      @postable = Message.find(params[:message_id])
    end
end
