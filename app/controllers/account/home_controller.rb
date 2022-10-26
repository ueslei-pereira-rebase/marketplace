module Account
  class HomeController < AccountController

    def index
      company_id = current_user.company_id

      @products = Company.products_active(company_id)
      .order(created_at: :desc)
      .page(params[:page])
      .per(12)
    end
  end
end