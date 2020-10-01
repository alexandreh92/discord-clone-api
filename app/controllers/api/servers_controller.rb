module Api
  class ServersController < ApplicationController
    def index
      servers = current_user.servers

      render json: servers
    end

    def join
      # when user joins a server
    end

    def create
      server = Server.new(server_params)

      if server.save!
        current_user.servers << server
        ActionCable.server.broadcast "main_channel_#{current_user.id}", {
          event: ::Enums::ActionCableEvents::CREATE, data: server
        }
      else
        render json: {
          error: server.errors.full_messages
        }, status: :bad_request
      end
    end

    private

      def server_params
        params.permit(:name)
      end
  end
end
