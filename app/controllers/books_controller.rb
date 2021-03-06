class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    # @posts = Post.where(book_id: @book.id).order(created_at: :desc)
    @posts = Post.where(postable_id: @book.id).order(created_at: :desc)
  end
  
  def book_search
    # keyword_book으로 검색한 경우(책 검색 결과에 포스팅하기)
    if params.has_key?(:keyword_book)
      @keyword_book = params[:keyword_book]
      
      # 검색어가 있다면...
      if @keyword_book.present?

        @size = 50 # 한 화면에 표시할 검색 결과의 수

        if params[:page].to_s.empty?
          # 시작 위치가 정해져 있지 않으면 기본적으로 첫 페이지 보여주기
          @current_page = 1
        else
          
          # 시작 위치가 설정되어 있으면 해당 페이지로
          @current_page = params[:page].to_i

        end
        
        # url = "https://dapi.kakao.com/v2/search/book?query=" + @keyword_book + "&size=" + @size.to_s + "&page=" + @current_page.to_s 
        # url = "https://dapi.kakao.com/v2/search/book?target=title&query=" + @keyword_book + "&size=" + @size.to_s + "&page=" + @current_page.to_s 
        url = "https://dapi.kakao.com/v3/search/book?query=" + @keyword_book + "&size=" + @size.to_s + "&page=" + @current_page.to_s

        uri = URI.encode(url)
        res = RestClient.get(uri, headers={
          'Authorization' => Rails.application.credentials.kakao[:authorization_key]})
          
        unitokor = eval(res)
          
        # puts unitokor
          
        json_g = JSON.generate(unitokor)
        hash = JSON.parse(json_g)
          
        # @items = hash['items']
        @total_count = hash['meta']['total_count']
        
        # puts "############################################################"
        # puts @total_count
        # puts "현재 페이지 : " + @current_page.to_s + " 출력 건수 : " + @size.to_s + "  page * size : " + (@current_page * @size).to_s 
        
        # 마지막 페이지
        @max_index = @total_count / @size + 1
        
        # start_index와 end_index 값 지정하기
        if @current_page > 2
          @start_index = @current_page - 2
          if @current_page <= @max_index - 2
            @end_index = @current_page + 2 
          else
            @end_index = @max_index
          end
        else
          @start_index = 1
          if @max_index <= 5
            @end_index = @max_index
          else
            @end_index = 5
          end
        end
        
        # puts "현재 페이지 : " + @current_page.to_s + " 마지막 페이지 : " + @max_index.to_s
        # puts "start_index : " + @start_index.to_s + " end_index : " + @end_index.to_s 
        
        @items = hash['documents']

      end
    end
  
    # 검색어가 없으면 items에 빈 array 넘기기
    @items ||= []
    
  end
  
  def new

    @book = Book.new
    @book.posts.new

  end
  
  def create
    
    unless @book = Book.find_by(isbn: book_params[:isbn])

      thumbnail_url = book_params[:thumbnail]
      
      unless thumbnail_url.to_s.empty?
        thumbnail_path = URI.unescape(thumbnail_url.match(/^http.+?(http.+?)%3F/)[1].to_s)
      else
        thumbnail_path = nil
      end
  
      @book = Book.create(
        title: CGI.unescapeHTML(book_params[:title]),
        isbn:  book_params[:isbn],
        authors:  book_params[:authors],
        thumbnail:  thumbnail_path,
        publisher: book_params[:publisher],
        contents: CGI.unescapeHTML(book_params[:contents]),
        url: book_params[:url],
        date_time: book_params[:date_time],
        translators: book_params[:translators],
      )
      
    end

    # post = Post.new(content: book_params[:posts_attributes]['0'][:content])
    post = @book.posts.new(content: book_params[:posts_attributes]['0'][:content])
    post.user_id = book_params[:posts_attributes]['0'][:user_id]
    post.save

    redirect_to root_path
    
  end

  private
  
  def set_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title, :isbn, :authors, :thumbnail, :publisher, :contents, :url, :date_time, :translators, posts_attributes: [:user_id, :content])
  end
  
  # def post_params
  #   params.require(:book).permit(:user_id, :content)
  # end
end
