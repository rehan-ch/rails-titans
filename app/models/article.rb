# frozen_string_literal: true

# articles model
class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy, inverse_of: :article
end
