class UserSerializer < ActiveModel::Serializer
  attributes :id, :bio, :displayname,:avatar
end
