class UserSerializer < ActiveModel::Serializer
  attributes :id, :bio, :displayname,:avatar, :you_follow, :follows_you
end


def you_follow
  self[:you_follow]
end

def follows_you
  self[:follows_you]
end