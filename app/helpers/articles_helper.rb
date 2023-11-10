# frozen_string_literal: true

# Articles view helper
module ArticlesHelper
  def author_name(article)
    article.user.full_name.presence || article.user.email
  end
end
