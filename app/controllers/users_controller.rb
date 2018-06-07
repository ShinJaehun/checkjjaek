class UsersController < ApplicationController
  before_action :set_user
  
  # user controller를 이용해서 권한을 부여할 수 있도록
  # cancan에서 RESTful 스타일의 리소스 컨트롤러에 있는 모든 액션에 대해서 자동으로 권한을 부여함
  load_and_authorize_resource

  # GET 'users/:id'
  def show
    # params로 넘어온 사용자의 post들을 받아서 @posts 인스턴스로 넘김
    @posts = @user.posts.order(created_at: :desc)
  end
  
  # POST 'users/:id/follow'
  def follow
    # 현재 보여지는 page의 @user와 로그인한 current_user 사이의 follow 관계를
    # 설정하기 위한 toggle_follow() : 
    # @user의 followers에 current_user가 포함되어 있다면 @user의 followers에서 current_user를 삭제
    # 그렇지 않다면 @user의 followers에 current_user 추가
    @user.toggle_follow(current_user)
    redirect_back(fallback_location: root_path)
  end

  private
    
  def set_user
    @user = User.find(params[:id])
  end

end
