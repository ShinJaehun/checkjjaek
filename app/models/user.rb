class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # name 필드가 없을 때 입력오류 처리
  validates :name, presence: true
  
  # User와 Post의 1:N 관계
  has_many :posts
  
  # Comment
  has_many :comments
  
  # User와 Post의 likes를 통한 N:N 관계
  has_many :likes
  has_many :like_posts, through: :likes, source: :post

  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
  #followee를 찾을 때 자기 자신이 follower
  has_many :followees, through: :followee_follows, source: :followee
  
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
  #누가 나를 follow하는데 그 사람들의 ID가 키
  has_many :followers, through: :follower_follows, source: :follower

  # 유저가 생성된 다음에 권한을 부여하는 콜백 함수를 만들어준다.(rolify 관련)
  after_create :default_user
  
  # User를 생성할 때 role이 부여되어 있지 않으면 standard로 지정
  def default_user
    self.add_role(:standard) if self.roles.blank?
  end
  
  # DB에서 현재 로그인해 있는 사용자가 작성한 Post만 가지고 오기  
  def feed
    Post.where("user_id = ?", id)
  end
  
  def toggle_follow(user)
    if self.followers.include?(user)
      self.followers.delete(user)
    else
      self.followers.push(user)
    end
  end

end
