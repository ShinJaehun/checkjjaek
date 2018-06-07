class Book < ApplicationRecord
    # Book과 Post의 1:N 관계
    has_many :posts
end
