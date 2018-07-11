class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy
  
  def create
    @comment = @post.comments.new(comment_params)
    # 그래도 comment가 post와 user에 belongs_to이기 때문에 user 정보가 없으면 생성되지 않는 것 같다.
    @comment.user_id = current_user.id

    @comment.save
    
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @comment.destroy
    # 댓글 삭제하고 새로고침
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def set_comment
    # 이렇게 해 놓으면 @comment.post_id = params[:post_id] 할 필요 없음!
    @comment = @post.comments.find(params[:id])
  end
  
  def comment_params
      params.require(:comment).permit(:content)
  end
end
