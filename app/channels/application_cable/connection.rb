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
      # warden.authenticate(auth_options)
      p "CONNECTING"
      params = request.query_parameters()
      token = params["access-token"]
      uid = params["uid"]
      client = params["client"].to_s

      self.current_user = find_verified_user(token, uid, client)
    end

    private

    def find_verified_user(token, uid, client_id)
      user = User.find_by(email: uid)
      # last_token = user.tokens[client_id]['last_token']
      # p "client_id token: #{user.tokens[client_id]}"
      # p "last_token: #{last_token}"
      #
      # token_hash = user.tokens[client_id]['token']
      # tokens_match = DeviseTokenAuth::Concerns::User.tokens_match?(token_hash, token)
      # p "token hash: #{token_hash}"
      # p "tokens match: #{tokens_match}"

      if verified_user = user
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
