class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description
      t.text :image, null: false
      t.float :acreage
      t.float :price, null: false
      t.string :address, null: false
      t.string :phone_contact, null: false
      t.integer :status, default: 0
      t.references :post_category, foreign_key: true
      t.references :toilet_type, foreign_key: true

      t.timestamps
    end
  end
end
