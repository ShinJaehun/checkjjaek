class PostsController < ApplicationController
  # before_action :load_postable, only: [:create]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  
  # cancancan에서 user 로그인 상태를 체크하므로 check_user는 불필요
  # before_action :check_user, only: [:edit, :update, :destroy]

  # index와 show action을 제외한 모든 action은 로그인이 필요함
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!
  
  # cancancan으로 posts의 authorization을 처리하겠다는 의미
  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  def index

    # follower 수를 기준으로 한 추천 사용자    
    @suggested_friends_by_followers =  User.all.sort{|a,b| b.followers.count <=> a.followers.count}.first(10)
    # 최근 책짹
    @recent_posts = Post.order(id: :desc).limit(10);
    # 가장 많은 좋아요를 받은 책짹
    @favorite_posts = Post.all.sort{|a,b| b.like_users.count <=> a.like_users.count}.first(10)

    @posts = Post.where(user_id: current_user.followees.ids.push(current_user.id)).order(created_at: :desc)

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end
  
  def search
    if params.has_key?(:keyword)
      @keyword = params[:keyword]
      
      if @keyword.present?
        @searched_users = User.where('name like ?', "%#{@keyword}%").order(created_at: :desc)
        @searched_books = Book.where('title like ?', "%#{@keyword}%").order(created_at: :desc)
        @searched_posts = Post.where('content like ?', "%#{@keyword}%").order(created_at: :desc)
      end

    end
    
  end

  # GET /posts/1/edit
  def edit
    # and return은 조건에 해당한다면 이후의 코드를 건너뛰고 return 처리한다는 의미
    # current_user가 post를 작성한 user가 아니라면 무조건 root_path로...
    # current_user가 작성하지 않은 포스트를 /posts/1/edit 뭐 이런 형태로 수정하기 위해 접근하면 index 페이지로 되돌린다
    @posts = Post.where(postable_id: @post.postable.id).order(created_at: :desc)

    redirect_to root_path and return unless @post.user == current_user
  end
  
  # POST 'posts/:id/like'
  def like
    # 해당 post에 대해 toggle_like() 실행
    @post.toggle_like(current_user)
    # 이전 페이지로 돌아갈 수 없다면 root_path로 가기
    redirect_back(fallback_location: root_path)
  end
  
  # POST /posts
  # POST /posts.json
  # def create
  #   @post = @postable.posts.new(post_params)
  #   # 어느 순간에 postable이 정상적으로 작동되었는지 도저히 알 수가 없다...
  #   @post.user = current_user

  #   respond_to do |format|
  #     if @post.save
  #       # format.html { redirect_to @post, notice: 'Post was successfully created.' }
  #       format.html { redirect_to root_path, notice: 'Post was successfully created.' }
  #       format.json { render :show, status: :created, location: @post }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        # format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # GET /posts/hashtag/:name
  def hashtags
    # params로 넘긴 tag를 받아서
    @tag = Tag.find_by(name: params[:name])
    # 해당 tag를 갖고 있는 posts 찾고 view로 보이기
    @posts = @tag.posts.order(created_at: :desc)
    # 추천 사용자를 표시하기 위해 
    @users = User.all
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # white list로 content와 함께 저장된 book instance의 book_id 넘기기
  def post_params
    # params.require(:post).permit(:content, :book_id)
    params.require(:post).permit(:content)

  end
    # cancancan에서 user의 로그인 상태를 확인하므로 불필요함
  # def check_user
  #   redirect_to root_path, notice: '권한이 없습니다.' and return unless @post.user == current_user
  # end
  
  # def load_postable
  #   resource, id = request.path.split('/')[1, 2]
  #   @postable = resource.singularize.classify.constantize.find(id)
    
  # end
end
