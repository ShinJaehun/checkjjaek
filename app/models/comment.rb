class Comment < ApplicationRecord
    # User/Post와 Comment의 1:N 관계
    belongs_to :post
    belongs_to :user
end
