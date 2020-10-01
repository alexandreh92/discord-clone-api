class RoomsPresenter
  attr_reader :rooms

  def initialize(rooms:)
    @rooms = rooms
  end

  def as_json
    rooms.map do |room|
      RoomPresenter.new(
        room: room
      ).as_json
    end
  end
end
