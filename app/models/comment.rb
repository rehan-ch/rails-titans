# frozen_string_literal: true

# comments model
class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy, inverse_of: comments
  belongs_to :parent, class_name: 'Comment', optional: true
end
