class PhotoSerializer < ActiveModel::Serializer
  attributes :id,:file,:spinoffs
  #has_many :spinoffs
  has_many :comments
  belongs_to :user

  def spinoffs
    object.spinoffs.map{|photo|
      #ActiveModelSerializers::SerializableResource.new(photo,serializer: PhotoSerializer)
      {
        id: photo.id,
        file:photo.file,
        user: {
          id:photo.user.id, displayname:photo.user.displayname
        },
        comments:photo.comments.map{|comment|
          ActiveModelSerializers::SerializableResource.new(comment,serializer: CommentSerializer)
        }
      }
    }
  end
end
