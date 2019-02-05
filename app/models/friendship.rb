class Friendship < ApplicationRecord

  belongs_to :follower, class_name: "User"
  # the followee is the person being followed. Yes this is a real world
  belongs_to :followee, class_name: "User"


end
