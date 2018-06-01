class UsersController < ApplicationController
  before_action :set_user
  
  #user controller를 이용해서 권한을 부여할 수 있도록
  load_and_authorize_resource

  # GET 'users/:id'
  def show
    @posts = @user.posts
  end
  
  # POST 'users/:id/follow'
  def follow
    @user.toggle_follow(current_user)
    redirect_back(fallback_location: root_path)
  end

  private
    
  def set_user
    @user = User.find(params[:id])
  end

end
