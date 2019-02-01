class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_DName
  def user_DName
     object.user.displayname
  end
  #def :user_avatar
  #  {userAvatar: object.user.avatar}
  #end
end
