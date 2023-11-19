# frozen_string_literal: true

# articles model
class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :history

  belongs_to :user, inverse_of: :articles
  has_many :comments, dependent: :destroy, inverse_of: :article

  validates :title, :content, :user_id, presence: true

end
