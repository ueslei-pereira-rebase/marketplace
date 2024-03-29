module Account
  class UsersController < AccountController

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      response = Account::UpdateUserService.new(params_permitted).execute
      @user = response.object

      if response.success?
        redirect_to account_user_path(@user), notice: response.context
      else
        redirect_to edit_account_user_path(@user), alert: response.context
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      redirect_to new_user_session_path, notice: 'Seu registro foi deletado'
    end

    private

    def params_permitted
      params.require(:user).permit(:id, :subsidiary, :department, :phone, :mobile, :avatar)
    end

  end
end