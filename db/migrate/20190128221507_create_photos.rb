class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :file_id
      t.integer :photo_id
      t.integer :like_count

      t.timestamps
    end
  end
end
