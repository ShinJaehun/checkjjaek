class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]
        @comment.user_id = current_user.id
        @comment.save
        
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
    end
    
    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
