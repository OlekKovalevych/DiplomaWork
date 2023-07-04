# frozen_string_literal: true

module Api
  class UsersController < ActionController::API
    include ExceptionHandler

    before_action :set_user, only: %i[show update]

    # GET /api/users/:id
    def show
      render json: @user
    end

    # PUT /api/users/:id
    def update
      @user.update!(user_params)
      render json: @user
    end

    # TODO: Realize soft delete

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
end
