module Account
  class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
      @advertise_products = Product.where(user_id: current_user)
        .order(created_at: :desc)
        .page(params[:page])
        .per(4)
    end

    def new
      @product = Product.new
    end

    def create
      Advertise::CreateProductService.new(params_permitted, current_user).execute
      redirect_to account_products_path
    end

    def edit
      @advertise_products = Product.find(params[:id])
      #terminar
    end


    def desactive
      advertise = current_user.products.find(params[:id])
      advertise.desactive!

      redirect_to account_products_path(page: params[:page])
    end

    def active
      advertise = current_user.products.find(params[:id])
      advertise.active!

      redirect_to account_products_path(page: params[:page])
    end
    
    private

    def params_permitted
      params.require(:product).permit(:amount, :price, :title, :body, images: [])
    end
  end
end