class UserSerializer < ActiveModel::Serializer
  attributes :id, :bio, :displayname

  has_many :photos
end
