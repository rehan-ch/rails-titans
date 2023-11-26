# frozen_string_literal: true

# users model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend FriendlyId
  friendly_id :slug_candidate, use: :history
  acts_as_followable
  acts_as_follower

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :articles, dependent: :destroy, inverse_of: :user
  has_many :comments, dependent: :destroy, inverse_of: :user

  validates :first_name, :last_name, :email, presence: true

  def full_name
    return '' unless first_name && last_name

    "#{first_name} #{last_name}"
  end

  def slug_candidate
    ["#titan-#{full_name}"]
  end
end
