module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include Warden
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

      def find_verified_user
        reject_unauthorized_connection unless request.params[:token]

        token = request.params[:token]
        decoder = JWTAuth::UserDecoder.new
        decoder.call(token, :user, nil)
      end
  end
end
