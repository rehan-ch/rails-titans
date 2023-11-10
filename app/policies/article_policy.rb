# frozen_string_literal: true

# article policy for authorization
class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def update?
    user.present?
  end
end
