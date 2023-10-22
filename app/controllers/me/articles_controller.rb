class Me::ArticlesController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_user!
    before_action :scope
    before_action :find_article, only: %I[edit update show destory]

    def index
        @articles = scope
    end

    def show; end

    def new
        @article = scope.new
    end

    def create
        @article = scope.new(params[:article])
        
        if @artilce.save
            redirect_to @article
        else
            render 'new'
        end
        
    end

    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def edit; end

    def destroy
        @article.destory
    end

    private
    def scope
        @scope ||= current_user.articles
    end

    def find_article
        @article = scope.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end
    
end
