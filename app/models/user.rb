class User < ApplicationRecord
validates :username, uniqueness: true, presence: true

has_secure_password
#mount_base64_uploader :old_avatar, OldAvatarUploader
mount_base64_uploader :avatar, AvatarUploader

  has_many :photos
  has_many :photos_owned, lambda {includes(:spinoffs)}, class_name: "Photo"
  has_many :spinoffs, through: :photos
  has_many :following, foreign_key: "follower_id", class_name: "Friendship"
  has_many :followers, foreign_key: "followee_id", class_name: "Friendship"
  scope :search, -> (name){where('displayname LIKE :search', search: "%#{name}%") }
  scope :with_follow_indicator, -> (user){
    select("users.*,
      CASE WHEN 
        EXISTS (#{user.following.to_sql} AND friendships.followee_id = users.id)
        THEN TRUE
        ELSE FALSE
      END AS you_follow

     , CASE WHEN
      EXISTS (#{user.followers.to_sql} AND friendships.follower_id = users.id)
      THEN TRUE 
      ELSE FALSE
      END AS follows_you")
    }


end
