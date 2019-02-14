class ProfileSerializer < ActiveModel::Serializer
  attributes :user, :photos

  def user
    UserSerializer.new(object[:user])
  end

  def photos
    object[:photos].map{|photo|
      PhotoSerializer.new(photo)
    }
  end

end
