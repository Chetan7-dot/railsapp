require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is not valid without a product_name" do
    product = Product.new(product_name: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a product_description" do
    product = Product.new(product_description: nil)
    expect(product).to_not be_valid
  end
  it "is not valid without a product_price" do
    product = Product.new(product_price: nil)
    expect(product).to_not be_valid
  end
  it "is not valid without a title" do
    product = Product.new(product_in_strock: nil)
    expect(product).to_not be_valid
  end

  context 'ActiveRecord associations' do
    it 'belongs to productable' do
      expect(Product.reflect_on_association(:productable).macro).to be (:belongs_to)
    end
  end
  describe "Associations" do
    it { should have_many(:cart_items) }
  end

  describe "GET products#new" do
    it "should render products#new template" do
    end
  end
end
