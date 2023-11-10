class ArticleMailer < ApplicationMailer
  def new_article
    @user = params[:user]
    @receivers = @user.followers
    @article = params[:article]
    mail(to: @receivers.pluck(:email), subject: 'Latest Article Published')
  end
end
