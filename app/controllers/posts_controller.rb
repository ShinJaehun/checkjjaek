class PostsController < ApplicationController
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
    # @posts = Post.all
    # 마지막에 자기 자신이 쓴 글 까지 추가하기 위해서 push했음
    if params.has_key?(:content)
      @posts = Post.where('content like ?', "%#{params[:content]}%")
    else 
      @posts = Post.where(user_id: current_user.followees.ids.push(current_user.id))
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end
  
  def search
    # @post = Post.new
    # Post.set_book_data(params[:keyword])
    @keyword = params[:keyword]
      
    url = "https://openapi.naver.com/v1/search/book.json?query=" + @keyword + "&display=10&start=1"
    uri = URI.encode(url)
    res = RestClient.get(uri, headers={ 'X-Naver-Client-Id' => 'GCDuCNDURZvBzhGoo7iL', 'X-Naver-Client-Secret' => '_MpznoTrPe' })
      
    unitokor = eval(res)
      
    # puts unitokor
      
    json_g = JSON.generate(unitokor)
    hash = JSON.parse(json_g)
      
    @items = hash['items']
  end

  # GET /posts/new
  def new
    unless @book = Book.find_by(isbn: params[:isbn])
      url = params[:image]
      
      image_path = URI.parse(url).host + URI.parse(params[:image]).path
      
      @book = Book.create(
        title: params[:title],
        isbn:  params[:isbn],
        author:  params[:authro],
        image:  image_path,
        publisher: params[:publisher]
      )  
    end
    
    # find_or_create_by
    
    @post = Post.new(book: @book)
    
  end

  # GET /posts/1/edit
  def edit
    redirect_to root_path and return unless @post.user == current_user
  end
  
  # POST 'posts/:id/like'
  def like
    @post.toggle_like(current_user)
    redirect_back(fallback_location: root_path)
  end
  

  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
  
  def mypage
    @posts = current_user.posts
  end
  
  def hashtags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :book_id)
    end
    
    # cancancan에서 user의 로그인 상태를 확인하므로 불필요함
    # def check_user
    #   redirect_to root_path, notice: '권한이 없습니다.' and return unless @post.user == current_user
    # end
end
