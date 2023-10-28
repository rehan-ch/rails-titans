# frozen_string_literal: true

# users controller for public users to show user profile and listing
class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show; end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
