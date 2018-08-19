class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # name 필드가 없을 때 입력오류 처리
  validates :name, presence: true
  
  # User와 Post의 1:N 관계
  has_many :posts, dependent: :destroy
  
  # User와 Comment의 1;N 관계
  has_many :comments, dependent: :destroy
  
  # User와 Post의 likes를 통한 N:N 관계
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  # User와 followee(사실은 followee도 User)는 followee_follows라는 Join table을 through한 N:N 관계
  # 내가 follow하는 사람들을 찾으려면 내 ID인 follower_id를 기준으로 찬음
  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :followees, through: :followee_follows, source: :followee

  # User와 follower(사실은 follower도 User)는 follower_follows라는 Join table을 through한 N:N 관계
  # 누가 나를 follow해서 그 사람들을 찾으려면 내 ID인 followee_id를 기준으로 찾음
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow", dependent: :destroy
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
  
  # @user의 followers에 current_user가 포함되어 있다면 @user의 followers에서 current_user를 삭제
  # 그렇지 않다면 @user의 followers에 current_user 추가
  def toggle_follow(user)
    if self.followers.include?(user)
      self.followers.delete(user)
    else
      self.followers.push(user)
    end
  end

end
