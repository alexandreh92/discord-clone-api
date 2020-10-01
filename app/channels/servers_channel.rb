class ServersChannel < ApplicationCable::Channel
  def subscribed
    server = Server.find_by(id: params[:server])
    stream_for server
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
