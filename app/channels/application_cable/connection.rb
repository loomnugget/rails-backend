module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # Connections are instances of ApplicationCable::Connection. In this class,
    # you authorize the incoming connection, and proceed to establish it
    # if the user can be identified.

    # identified_by - connection identifier that can be used to find the specific connection later.
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      # verified_user = User.find_by(token: request.params[:token])
      if verified_user = User.last
        # p "VERIFIED_USER: #{verified_user}"
        # verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
