class Follow < ApplicationRecord
  # User와 followee(사실은 이것도 User)는 followee_follows 테이블을 through한 N:N 관계
  belongs_to :followee, class_name: "User"
  # User와 follower(사실은 이것도 User)는 follower_follows 테이블을 through한 N:N 관계
  belongs_to :follower, class_name: "User"
end
