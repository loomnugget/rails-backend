module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # Connections are instances of ApplicationCable::Connection. In this class,
    # you authorize the incoming connection, and proceed to establish it
    # if the user can be identified.

    # identified_by - connection identifier that can be used to find the specific connection later.
    # identifiers will automatically create a delegation method of the same name on the channel instance.

    # Authenticating with devise token auth
    # https://github.com/lynndylanhurley/devise_token_auth/issues/986

    identified_by :current_user

    def connect
      self.current_user = find_verified_user

      params = request.query_parameters()
      uid = params[:uid]
      token = params[:token]
      client_id = params[:client]

      user = User.find_by(email: uid)
      valid_user = user.valid_token?(token, client_id)
      p "user: #{user}"
      p "VALID_USER: #{valid_user} #{user}"
    end

    def find_verified_user
      if verified_user = User.last
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
