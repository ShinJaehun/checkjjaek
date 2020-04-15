class MessagesController < ApplicationController
  before_action :set_message
#  before_action :authenticate_user!
#  load_and_authorize_resource

  def new
    puts '#########################################################'
    puts 'New ACTION'
    puts '#########################################################'
#    @message = Message.new
#    @message.posts.new
#    respond_to do |format|
#      format.html
#      format.js
#    end

  end
  
  def create

    puts '#########################################################'
    puts 'CREATE ACTION'
    puts message_params
    puts '#########################################################'

    @message = Message.create(
      sender_id: message_params[:sender_id],
      receiver_id: message_params[:receiver_id])

    post = @message.posts.new(content: message_params[:posts_attributes]['0'][:content])
    post.user_id = message_params[:posts_attributes]['0'][:user_id]
    post.save

    redirect_to root_path


#    @message = Message.new(message_params)
#    post =  @message.posts.new(content: message_params[:posts_attributes]['0'][:content])
#    post.user_id = message_params[:posts_attributes]['0'][:user_id]
#    puts @message.id
#    puts @message.posts.content
#    redirect_back(fallback_location: root_path)
  end

  private
  
  def set_message
    puts '#########################################################'
    puts 'set_message'
    puts '#########################################################'
  end
  def message_params
    
#    params.require(:message).permit(:sender_id, :receiver_id)
#    params.require(:post).permit(:user_id, :content)
    params.require(:message).permit(:sender_id, :receiver_id, posts_attributes: [:user_id, :content])
  end
end
