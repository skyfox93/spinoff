class ChangeFileIdToFile < ActiveRecord::Migration[5.2]
  def change
    change_column :photos, :file_id, :string
    rename_column :photos, :file_id, :file
  end
end
