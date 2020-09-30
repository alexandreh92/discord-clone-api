class Room < ApplicationRecord
  # Associations
  belongs_to :server
  has_many :user_room_messages
  has_many :users, through: :user_room_messages
end
