# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :article

  def new
    @comment = @article.comments.new(parent: comment)
  end

  def edit
    @comment = Comment.find(params[:id])
    authorize @post, :update?
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @post
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    authorize @post
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id, :parent_id)
  end

  def article
    @article ||= Article.friendly.find(params[:article_id])
  end

  def comment
    @comment ||= @article.comments.friendly.find(params[:comment_id])
  end
end
