class Tag < ApplicationRecord
  # Post와 Tag는 N:N 관계
  has_and_belongs_to_many :posts
end
