json.extract! post, :id, :title, :description, :image, :acreage, :price, :address, :phone_contact, :status, :post_category_id, :toilet_type_id, :created_at, :updated_at
json.url post_url(post, format: :json)
