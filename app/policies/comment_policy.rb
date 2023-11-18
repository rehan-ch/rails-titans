# frozen_string_literal: true

# comment policy for authorization
class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def update?
    auther?
  end

  def destroy?
    auther?
  end

  private

  def auther?
    user.present? && comment.user == user
  end
end
