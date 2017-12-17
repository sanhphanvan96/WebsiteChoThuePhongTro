class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :toilet_type
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :image, presence: true, file_size: { less_than: 3.megabytes }
end
