module Api
  class MessagesController < ApplicationController
    def index
      rooms = current_user.rooms.distinct(:id)

      render json: RoomMessagesPresenter.new(
        rooms: rooms
      ).as_json
    end

    def create
      message = current_user.user_room_messages.new(user_room_message_params)

      if message.save!
        RoomsChannel.broadcast_to message.room, {
          event: ::Enums::ActionCableEvents::CREATE,
          data: UserRoomMessagePresenter.new(user_room_message: message).as_json
        }
      else
        render json: {
          errors: message.errors.full_messages
        }, status: :bad_request
      end
    end

    private

      def user_room_message_params
        params.permit(:content, :room_id)
      end
  end
end
