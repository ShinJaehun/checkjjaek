class Post < ApplicationRecord
  # Post를 입력할 때 content를 반드시 입력해야 함
  validates :content, presence: { message: '내용을 입력하세요.' }

  # User와 Post의 관계 때문에 모든 Post는 입력한
  # 사용자의 ID 필드가 입력되어 있어야 함
  validates :user_id, presence: true

  # User와 Post의 1:N 관계
  belongs_to :user

  belongs_to :book

  # Post와 User의 likes를 통한 N:N 관계
  has_many :likes
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

  # Post, hashtag 해시태그 관련....
  has_and_belongs_to_many :tags
  
  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.content.scan(/#\s*\S*|#\S*\s*/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      post.tags << tag
    end
  end

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
