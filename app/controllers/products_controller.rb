class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show;  end

  def edit;  end

  def create
    @user = current_user
    @product = @user.products.new(product_params)
    @product.user_id = current_user.id
    if @product.save
    UserMailer.new_product_email(@product, @user.email).deliver_now
    # SendNotificationsJob.perform_now(@product)
    redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :product_description, :product_in_strock,
                                    :product_price, :product_size, :user_id, :category_id,
                                    images: [])
  end
end
