class ArticlesController < ApplicationController

    def index
        @articles = Article.scoped
    end

    def show
        @article = Article.find(params[:id])
        if current_user
            @new_comment = @article.comments.new(user: current_user)
        end
    end
end
