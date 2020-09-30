class CreateUserRoomMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_room_messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
