module Maneger
  class ManagerController < ApplicationController
    before_action :authenticate_admin!

  end
end
