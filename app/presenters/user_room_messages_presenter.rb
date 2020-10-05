class UserRoomMessagesPresenter
  attr_reader :room

  def initialize(room:)
    @room = room
  end

  def as_json
    {
      room_id: room.id,
      messages: render_messages
    }
  end

  private

    def render_messages
      room.user_room_messages.map do |user_room_message|
        UserRoomMessagePresenter.new(
          user_room_message: user_room_message
        ).as_json
      end
    end
end
