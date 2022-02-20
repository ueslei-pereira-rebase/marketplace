class ApplicationController < ActionController::Base
  # layout 'minutes_management'

  before_action :authenticate_user!
end
