# frozen_string_literal: true

# Dashboard for user
class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show; end
end
