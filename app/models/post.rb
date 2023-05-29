class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :notifications, as: :notificationable, dependent: :destroy
end
