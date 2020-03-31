class Message < ApplicationRecord
  has_many :posts, as: :postable
  accepts_nested_attributes_for :posts

end
