class PhotoSerializer < ActiveModel::Serializer
  attributes :id,:file,:photo_id,:spinoff_count
  belongs_to :user
  belongs_to :owner

  def spinoff_count
    object.spinoffs.length
  end
end
