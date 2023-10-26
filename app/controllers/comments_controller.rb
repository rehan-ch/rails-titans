# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :article

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def update
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id, :parent_id)
  end

  def article
    @article ||= Article.find_by(id: params[:article_id])
  end
end
