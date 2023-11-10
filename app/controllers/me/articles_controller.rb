# frozen_string_literal: true

# me module
module Me
  # current user articles
  class ArticlesController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_user!
    before_action :scope
    before_action :find_article, only: %I[edit update show destroy]

    def index
      @articles = scope
    end

    def show; end

    def new
      @article = scope.new
    end

    def edit; end

    def create
      @article = scope.new(article_params)

      if @article.save
        ArticleMailer.with(article: @article, user: current_user).new_article.deliver_later
        redirect_to me_article_path(@article)
      else
        render 'new'
      end
    end

    def update
      if @article.update(article_params)
        redirect_to me_article_path(@article)
      else
        render 'edit'
      end
    end

    def destroy
      @article.destroy
      redirect_to me_articles_path
    end

    private

    def scope
      @scope ||= current_user.articles
    end

    def find_article
      @article = scope.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :user_id)
    end
  end
end
