# frozen_string_literal: true

# follow and unfollow model
class Follow < ApplicationRecord
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, polymorphic: true
  belongs_to :follower,   polymorphic: true

  def block!
    update(:blocked, true)
  end
end
