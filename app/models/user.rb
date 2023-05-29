class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, dependent: :destroy

  # define have friends
  has_many :friendships, class_name: 'Friendship', foreign_key: 'user_id', dependent: :destroy
  has_many :friends, through: :friendships

  # define received_frriendship
  has_many :recived_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :recived_friends, through: :recived_friendships, source: 'user'

  # define notification relationships
  has_many :notifications, as: :notificationable, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :email, presence: true, uniqueness: true

  before_create :generate_uuid
  def generate_uuid
    self.id = SecureRandom.uuid
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
