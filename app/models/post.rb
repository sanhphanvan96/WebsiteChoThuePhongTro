class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :toilet_type
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :address, presence: true
  validates :phone_contact, presence: true
  validates :image, presence: true, file_size: { less_than: 3.megabytes }
  validates :price, presence: true
end
