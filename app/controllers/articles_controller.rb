class ArticlesController < ApplicationController

    def index
        @articles = Article.scoped
    end

    def show
        @article = Article.find(params[:id])
    end
end
