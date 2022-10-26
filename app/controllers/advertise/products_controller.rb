module Advertise
  class ProductsController < ApplicationController

    before_action :authenticate_user!

    def show
      @product = Product.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to account_products_path, flash[:alert] = "Houve um erro, produto nao encontrado"
    end

    def join
      Advertise::JoinListProductService.new(params, current_user).execute
    end

  end
end