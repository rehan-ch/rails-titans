# frozen_string_literal: true

# comments model
class Comment < ApplicationRecord
  extend FriendlyId
  friendly_id :comment_slug, use: :history

  belongs_to :article
  belongs_to :user
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy, inverse_of: :comment
  belongs_to :parent, class_name: 'Comment', optional: true

  validates :content, presence: true

  private

  def comment_slug
    "#{content&.first(5)}_comment"
  end
end
