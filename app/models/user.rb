class User < ApplicationRecord
  has_many :photos
  has_many :requests_made, foreign_key: "follower_id", class_name: "Friendship"
  has_many :requests_received, foreign_key: "followee_id", class_name: "Friendship"
  has_many :following,through: :requests_made, source:"followee"
  has_many :followers,through: :requests_received
end
