class Book < ApplicationRecord
  # Book과 Post의 1:N 관계
  has_many :posts, as: :postable
  accepts_nested_attributes_for :posts

  # accepts_nested_attributes_for :posts, reject_if: :reject_posts
  
  # def reject_posts
  #   attribute['content'].blank?
  # end
end
