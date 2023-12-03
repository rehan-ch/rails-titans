# frozen_string_literal: true

module Me
  class UsersController < ApplicationController
    before_action :set_user, only: %I[:edit]
    def edit; end

    private

    def set_user
      @user = current_user
    end
  end
end
