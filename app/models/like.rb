class Like < ApplicationRecord
  # User와 Post의 likes를 통한 N:N 관계
  belongs_to :user
  belongs_to :post
end
