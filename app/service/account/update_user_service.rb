module Account
  class UpdateUserService
    attr_reader :params
    def initialize(params)
      @params = params
    end

    def execute
      user = User.find(params[:id])
      params.delete(:id)

      if user.update(params)
        build_result(success: true, context: "Cadastro finalizado", object: user)
      else
        build_result(success: false, context: "Não foi possivel completar seu cadsatro, tente novamente", object: user)
      end
    end

    private

    def build_result(success: nil, context: nil, object: nil)
      OpenStruct.new(
        success?: success,
        context: context,
        object: object
      )
    end
  end
end