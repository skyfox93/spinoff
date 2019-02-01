class Photo < ApplicationRecord
  mount_base64_uploader :file, FileUploader
  belongs_to :photo, optional:true
  belongs_to :user
  has_many :comments
  has_many :spinoffs, foreign_key: "photo_id", class_name: "Photo"


end
