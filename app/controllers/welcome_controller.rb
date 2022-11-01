class WelcomeController < ApplicationController
  before_action :redirect_page, if: :authenticate_user!

  def index
  end

  private

  def redirect_page
    
  end

end