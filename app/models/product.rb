class Product < ApplicationRecord
  validates :product_name, :product_description, :product_price, :product_in_strock, presence: true
  belongs_to :productable, polymorphic: true
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize: '100x100'
  end
end
