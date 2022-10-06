module Advertise
  class CreateProductService
    attr_reader :params, :user
    
    def initialize(params, user)
      @params = params
      @user = user
    end

    def execute
      ActiveRecord::Base.transaction do
        user.products.create(params)
        #terminar
      end
    end

  end
end