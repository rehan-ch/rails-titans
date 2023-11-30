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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(first_name: data['first_name'],
           last_name: data['last_name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
end
end
