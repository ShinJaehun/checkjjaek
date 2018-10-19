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

  # def book_search
  #   # keyword_book으로 검색한 경우(책 검색 결과에 포스팅하기)
  #   if params.has_key?(:keyword_book)
  #     @keyword_book = params[:keyword_book]
      
  #     # 검색어가 있다면...
  #     if @keyword_book.present?

  #       @size = 50 # 한 화면에 표시할 검색 결과의 수

  #       if params[:page].to_s.empty?
  #         # 시작 위치가 정해져 있지 않으면 기본적으로 첫 페이지 보여주기
  #         @current_page = 1
  #       else
          
  #         # 시작 위치가 설정되어 있으면 해당 페이지로
  #         @current_page = params[:page].to_i

  #       end
        
  #       url = "https://dapi.kakao.com/v2/search/book?query=" + @keyword_book + "&size=" + @size.to_s + "&page=" + @current_page.to_s 
  #       # url = "https://dapi.kakao.com/v2/search/book?target=title&query=" + @keyword_book + "&size=" + @size.to_s + "&page=" + @current_page.to_s 
        
  #       uri = URI.encode(url)
  #       res = RestClient.get(uri, headers={
  #         'Authorization' => Rails.application.credentials.kakao[:authorization_key]})
          
  #       unitokor = eval(res)
          
  #       # puts unitokor
          
  #       json_g = JSON.generate(unitokor)
  #       hash = JSON.parse(json_g)
          
  #       # @items = hash['items']
  #       @total_count = hash['meta']['total_count']
        
  #       # puts "############################################################"
  #       # puts @total_count
  #       # puts "현재 페이지 : " + @current_page.to_s + " 출력 건수 : " + @size.to_s + "  page * size : " + (@current_page * @size).to_s 
        
  #       # 마지막 페이지
  #       @max_index = @total_count / @size + 1
        
  #       # start_index와 end_index 값 지정하기
  #       if @current_page > 2
  #         @start_index = @current_page - 2
  #         if @current_page <= @max_index - 2
  #           @end_index = @current_page + 2 
  #         else
  #           @end_index = @max_index
  #         end
  #       else
  #         @start_index = 1
  #         if @max_index <= 5
  #           @end_index = @max_index
  #         else
  #           @end_index = 5
  #         end
  #       end
        
  #       # puts "현재 페이지 : " + @current_page.to_s + " 마지막 페이지 : " + @max_index.to_s
  #       # puts "start_index : " + @start_index.to_s + " end_index : " + @end_index.to_s 
        
  #       @items = hash['documents']

  #     end
  #   end
  
  #   # 검색어가 없으면 items에 빈 array 넘기기
  #   @items ||= []
    
  # end


  # GET /posts/new
  # def new
    
  #   if params[:type] == "Book"
  #     # isbn을 기준으로 books 테이블에 동일한 책이 없다면
  #     unless @book = Book.find_by(isbn: params[:isbn])
      
  #       # image 같은 경우는 URL을 저장해야 하기 때문에...
  #       thumbnail_url = params[:thumbnail]
        
  #       #image_path = URI.parse(url).host + URI.parse(params[:image]).path
  #       # 이미지 경로 : bookthumb-phinf.pstatic.net/cover/001/559/00155992.jpg
  #       #image_path = url.gsub(/\?.*/, '')
  #       # 이미지 경로 : https://bookthumb-phinf.pstatic.net/cover/001/559/00155992.jpg
  #       # 준우 샘이 경로는 이렇게 full URL 형식으로 놔두는 편이 낫다고...
  #       # API가 제공하는 책 썸네일은 https인데 불러오지 못함...(인증서 관련)
  #       # 그래서 경로 앞에 http://만 붙이도록 함
  #       unless thumbnail_url.to_s.empty?
  #         # image_path = "http://" + URI.parse(url).host + URI.parse(params[:image]).path
  #         # thumbnail_path = URI.unescape(url.match(/http%.+/).to_s)
          
  #         # thumbnail_path = URI.unescape(thumbnail_url.match(/(http.*)(http.*)/)[2].to_s)
  #         thumbnail_path = URI.unescape(thumbnail_url.match(/^http.+?(http.+?)%3F/)[1].to_s)
  #       else
  #         thumbnail_path = nil  
  #       end
        
  #       # book instance를 DB에 저장
  #       @book = Book.create(
  #         # 책 제목에 &가 있으면 &amp;가 붙어 저장되는 버그를 해결 
  #         # title: params[:title].gsub(/&amp;/, "&"),
  #         # 그냥 이렇게 라이브러리를 사용하는게 낫겠지!
  #         title: CGI.unescapeHTML(params[:title]),
  #         isbn:  params[:isbn],
  #         authors:  params[:authors],
  #         thumbnail:  thumbnail_path,
  #         publisher: params[:publisher],
  #         contents: CGI.unescapeHTML(params[:contents]),
  #         url: params[:url],
  #         date_time: params[:date_time],
  #         translators: params[:translators],
  #         category: params[:category]
  #       )  
  #     end
      
  #     # 준우 샘이 위 로직은 find_or_create_by() 를 이용해서 구현하는 것도 좋을 것 같다고 하심
      
  #     # 새로 생성하든 기존의 인스턴스를 가지고 오든 @book 인스턴스를 가지고 새로운 post 인스턴스를 생성하기 위해
  #     # 바인딩할 빈 @post 넘기기
  #     # @post = Post.new(book: @book)
  #     # @post = @postable.posts.new
      
  #     # 관련 책짹 보여주기 위해
  #     @posts = Post.where(book_id: @book.id).order(created_at: :desc)

  #   end
    
  #   # @post = @postable.posts.new
  # end

  # GET /posts/1/edit
  def edit
    # and return은 조건에 해당한다면 이후의 코드를 건너뛰고 return 처리한다는 의미
    # current_user가 post를 작성한 user가 아니라면 무조건 root_path로...
    # current_user가 작성하지 않은 포스트를 /posts/1/edit 뭐 이런 형태로 수정하기 위해 접근하면 index 페이지로 되돌린다
    @posts = Post.where(book_id: @post.book.id).order(created_at: :desc)

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
  def create
    @post = @postable.posts.new(post_params)
    # 어느 순간에 postable이 정상적으로 작동되었는지 도저히 알 수가 없다...
    @post.user = current_user

    respond_to do |format|
      if @post.save
        # format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
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
