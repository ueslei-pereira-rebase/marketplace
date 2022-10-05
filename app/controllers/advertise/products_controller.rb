module Advertise
  class ProductsController < ApplicationController
    before_action :authenticate_user!

    def new
      @product = Product.new
    end
  end
end