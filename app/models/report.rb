class Report < ApplicationRecord
  has_many :posts, as: :postable
  
  belongs_to :book
end
