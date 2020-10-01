class UserRoomMessagesPresenter
  attr_reader :user_room_messages

  def initialize(user_room_messages:)
    @user_room_messages = user_room_messages
  end

  def as_json
    user_room_messages.map do |user_room_message|
      UserRoomMessagePresenter.new(
        user_room_message: user_room_message
      ).as_json
    end
  end
end
