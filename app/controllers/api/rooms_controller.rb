module Api
  class RoomsController < ApplicationController
    def index
      rooms = Room.includes(server: :users).where(
        servers: {
          users: { id: current_user.id }
        }
      )

      render json: ::RoomsPresenter.new(rooms: rooms).as_json
    end

    def join
      # when user joins a room
    end

    def create
      room = Room.new(room_params)

      if room.save
        ServersChannel.broadcast_to room.server, {
          event: ::Enums::ActionCableEvents::CREATE,
          data: RoomPresenter.new(room: room).as_json
        }
      else
        render json: { error: room.errors.full_messages }, status: :bad_request
      end
    end

    private

      def room_params
        params.permit(:name, :server_id)
      end
  end
end
