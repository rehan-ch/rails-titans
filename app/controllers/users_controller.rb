# frozen_string_literal: true

# users controller for public users to show user profile and listing
class UsersController < ApplicationController
  before_action :authenticate_user!, only: %I[follow un_follow]
  before_action :find_user, only: %I[show follow un_follow]

  def index
    @users = User.all
  end

  def show; end

  def follow
    current_user.follow(@user)
  end

  def un_follow; end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
