class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.belongs_to :user
      t.belongs_to :friend 
      t.boolean :confirmed, default:false

      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
