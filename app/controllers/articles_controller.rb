# frozen_string_literal: true

# article controller for general user
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.friendly.find(params[:id])
    return unless current_user

    @comment = @article.comments.new(user: current_user)
  end
end
