class UserMailer < ApplicationMailer
    def new_product_email(product,user)
      @product =Product.last
      @user = @product.user
      mail(to:@user.email, subject: "Product Deatils")
    end

    def send_notification_mail(product)
      @product =product
      mail(to: User.pluck(:email), subject: 'Simple Demo to showcase Active Job')
  end
end
