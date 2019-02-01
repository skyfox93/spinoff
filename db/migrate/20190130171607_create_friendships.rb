class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
