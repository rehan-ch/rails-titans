# frozen_string_literal: true

# public controller to show public pages
class PublicController < ApplicationController
  def welcome
    @artilces = Article.all
  end
  def about; end
  def contact_us; end
end
