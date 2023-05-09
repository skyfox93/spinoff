class PhotoSerializer < ActiveModel::Serializer
  attributes :id,:file,:photo_id,:spinoff_count
  has_many :spinoffs
  belongs_to :user
  belongs_to :owner

  def spinoff_count
    object.spinoffs.length
  end

  def spinoffs
    object.spinoffs.map{|photo|
      {
        id: photo.id,
        file:photo.file,
        user: {
          id:photo.user.id, displayname:photo.user.displayname
        }
      }
    }
  end
end
