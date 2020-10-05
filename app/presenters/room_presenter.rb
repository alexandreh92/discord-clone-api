class RoomPresenter
  attr_reader :room

  def initialize(room:)
    @room = room
  end

  def as_json
    {
      id: room.id,
      name: room.name,
      server_id: room.server_id
    }
  end
end
