class RoomPresenter
  attr_reader :room

  def initialize(room:)
    @room = room
  end

  def as_json
    {
      id: room.id,
      name: room.name,
      server_id: room.server_id,
      messages: UserRoomMessagesPresenter.new(
        user_room_messages: room.user_room_messages
      ).as_json
    }
  end
end
