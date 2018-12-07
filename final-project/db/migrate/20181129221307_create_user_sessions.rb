class CreateUserSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sessions do |t|
      t.belongs_to :user
      t.belongs_to :session
      t.boolean :ready, default:false 

      t.timestamps
    end
  end
end
