class Comment < ApplicationRecord
    # Comment의 content 200자 제한
    validates :content, length: { maximum: 200 }
    
    # User/Post와 Comment의 1:N 관계
    belongs_to :post
    belongs_to :user
end
