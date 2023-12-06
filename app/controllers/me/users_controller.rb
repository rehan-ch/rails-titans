# frozen_string_literal: true

module Me
  class UsersController < ApplicationController
    before_action :set_user, only: %I[edit update]
    def edit; end

    def update
      if current_user.update(user_params)
        flash[:success] = "User Updated successfully"
      else
        flash[:error] = "Something Wrong!!"
      end
      redirect_back fallback_location: root_path
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
    def set_user
      @user = current_user
    end
  end
end
