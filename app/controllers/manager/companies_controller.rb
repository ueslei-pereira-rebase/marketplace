module Manager
  class CompaniesController < ApplicationController
    before_action :authenticate_admin!

    def index;end

    def new
      @company = Company.new
    end
  end
end