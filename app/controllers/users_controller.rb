# users controller for public users to show user profile and listing

class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.friendly.find(params[:id])
    end
end
