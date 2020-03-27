class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :tweets, dependent: :destroy
  has_many :likes
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :following_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followed_users, through: :following_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followers, through: :following_relationships

  def follow(user)
    followed_users << user
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def like(tweet)
    liked_tweets << tweet
  end

  def unlike(tweet)
    liked_tweets.destroy(tweet)
  end

  def liked?(tweet)
    liked_tweet_ids.include?(tweet.id)
  end

  def to_param
    username
  end
end
