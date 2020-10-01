class UserRoomMessagePresenter
  attr_reader :user_room_message

  def initialize(user_room_message:)
    @user_room_message = user_room_message
  end

  def as_json
    {
      id: user_room_message.id,
      content: user_room_message.content,
      room_id: user_room_message.room_id,
      user: render_user(user_room_message.user)
    }
  end

  private

    def render_user(user)
      {
        id: user.id,
        username: user.username,
        email: user.email
      }
    end
end
