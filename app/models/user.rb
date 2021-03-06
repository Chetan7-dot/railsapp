class User < ApplicationRecord
  has_many :products, as: :productable
  has_many :orders
  has_one :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :initialize_cart

  def initialize_cart
    Cart.create(user_id: id)
  end
end
