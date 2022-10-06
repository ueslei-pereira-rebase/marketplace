module Advertise
  class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
      @advertise_products = current_user.products.all
    end

    def new
      @product = Product.new
    end

    def create
      Advertise::CreateProductService.new(params_permitted, current_user).execute
      redirect_to advertise_products_path
    end

    private

    def params_permitted
      params.require(:product).permit(:amount, :price, :title, :body, images: [])
    end
  end
end