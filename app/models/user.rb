# frozen_string_literal: true

# users model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend FriendlyId
  friendly_id :slug_candidate, use: :history

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  def full_name
    return '' unless first_name && last_name

    "#{first_name} #{last_name}"
  end

  def slug_candidate
    ["#titan-#{full_name}"]
  end
end
