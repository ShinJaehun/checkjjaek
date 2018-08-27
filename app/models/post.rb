class Post < ApplicationRecord
  # Post를 입력할 때 content를 반드시 입력해야 함 + 200자 제한
  validates :content, presence: { message: '내용을 입력하세요.' }, length: { maximum: 200 }

  # User와 Post의 관계 때문에 모든 Post는 입력한
  # 사용자의 ID 필드가 입력되어 있어야 함
  validates :user_id, presence: true

  # User와 Post의 1:N 관계
  # counter_cache는 post 수에 따른 user 리스트를 얻기 위해서
  belongs_to :user, :counter_cache => :posts_count

  # Book과 Post의 1:N 관계
  belongs_to :book
  
  # Post와 Comment의 1:N 관계
  has_many :comments, dependent: :destroy

  # Post와 User의 likes를 통한 N:N 관계
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  
  # @post.toggle_like(current_user)
  def toggle_like(user)
    # like_users 중에 내가 포함되어 있다면
    if self.like_users.include?(user)
      self.like_users.delete(user)
    else
      # self.like_users << user
      self.like_users.push(user)
    end
  end

  # Post와 hashtag의 N:N 관계
  # 이렇게 해도 posts_tags라는 Join 테이블이 자동으로 생성됨
  has_and_belongs_to_many :tags
  
  # post instance를 생성하고 나서 사용자가 입력한 content에서 항상 태그를 찾고 
  # tags 테이블의 name을 조회해서 tag를 가져오거나 새로 생성하여 
  # 해당 post의 tags hash에 추가함
  # after_create : deprecated라는데 뭘 대신 써야 하는지 모르겠다...
  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.content.scan(/#\s*\S*|#\S*\s*/)
    # /#\s*\S*|#\S*\s*/ : white space character와 매칭되는 문자는 모두 선택
    hashtags.uniq.map do |hashtag|
    #uniq : 중복되는 element는 제거해서 return하는 method
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      #find_or_create_by : DB에서 해당 attribute가 포함된 record를 찾아 return 없다면 새로 생성
      post.tags << tag
    end
  end

  # post를 업데이트할 때는 기존에 저장되어 있던 post의 tags들도 모두 지웠다가
  # 업데이트 전에 다시 사용자가 입력한 content에서 태그를 찾아 tags hash에 갱신함
  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    hashtags = self.content.scan(/#\s*\S*|#\S*\s*/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      post.tags << tag
    end
  end

end
