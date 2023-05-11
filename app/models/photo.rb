class Photo < ApplicationRecord
  mount_base64_uploader :file, FileUploader
  
  belongs_to :photo, optional:true
  belongs_to :user
  has_many :comments
  has_many :spinoffs, foreign_key: "photo_id", class_name: "Photo"
  scope :newest, -> {order(created_at: :desc)}
  scope :include_relations, -> {includes(:spinoffs).includes(:user).includes(photo: :user)}
  attr_writer :spinoff_count

  def self.add_spinoff_counts(collection)
    ids = collection.map{|photo| photo.id}
    counts = Photo.where(photo_id: ids ).group(:photo_id).count
    collection.each{|photo|
      photo.spinoff_count = counts[photo.id]
    }
  end

  def spinoff_count
      @spinoff_count ||= self.spinoffs.count
  end

  def owner
    if self.photo_id
      self.photo.user
    else
      self.user
    end
  end

end