# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview
  def new_article
    ArticleMailer.with(user: User.last).new_article
  end
end
