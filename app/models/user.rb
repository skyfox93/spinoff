class User < ApplicationRecord
  has_many :photos
  has_many :requests_made, foreign_key: "follower_id", class_name: "Friendship"
  has_many :requests_received, foreign_key: "followee_id", class_name: "Friendship"
  has_many :following,through: :requests_made, source:"followee"
  has_many :followers,through: :requests_received

  # people who have accepted the users follow requests
  def really_following
    self.requests_made.collect{|friendship|
      friendship.accepted ? friendship.followee  : nil
    }.compact
  end


    # people who the user has requested to follow but is not currently really_following
  def wanna_follow
    self.requests_made.collect{|friendship|
      friendship.accepted ? nil  : friendship.followee
    }.compact
  end

    # people who requested to be followers but have not been accepted
  def wannabe_followers
    self.requests_received.collect{|friendship|
      friendship.accepted ? nil : friendship.follower
    }.compact
  end

  # followers who the user has accepted
  def really_followers
    self.requests_received.collect{|friendship|
      friendship.accepted ? friendship.follower : nil
    }.compact
  end



  def self.search(follower_id, name)
    # find users that match the search

    follower=User.find(follower_id)
    requests=follower.requests_made

    all_results=self.where('displayname LIKE :search', search: "%#{name}%")

    # for each result, check if a friendship exists
      # if it does not, sort user into no_relation
      # if friendship exists, check if it has been accepted
        # if it was accepted, sort user into following
        # otherwise sort them into requested
    requested= all_results.select{|followee|
      follower.wanna_follow.include?(followee)
      }

    following= all_results.select{|followee|
      follower.really_following.include?(followee)
    }

    no_relation=all_results-following-requested
    {following: following, no_relation: no_relation, requested: requested}
  end


  def owned_photos
    Photo.all.select{|photo|
      photo.owner==self
    }
  end

end
