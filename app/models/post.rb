class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :toilet_type
  belongs_to :user
  mount_uploader :image, ImageUploader
end
