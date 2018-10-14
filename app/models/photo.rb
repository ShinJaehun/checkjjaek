class Photo < ApplicationRecord
  has_many :posts, as: :postable

  mount_uploader :image, ImageUploader
end
