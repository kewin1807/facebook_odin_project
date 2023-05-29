class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :friends, though: :friendships

  # define received_frriendship
  has_many :recived_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :recived_friends, through: :recived_friendships, source: 'user'

  # define notification relationships
  has_many :notifications, as: :notificationable, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook github]

  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :email, presence: true, uniqueness: true
end
