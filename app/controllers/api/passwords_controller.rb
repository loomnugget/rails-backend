class Api::PasswordsController < Devise::PasswordsController
  # send_reset_password_instructions should contain a link to our frontend code where
  # a user submits a new password/password confirmation instead of the default rails html template
  def create
    resource = User.find_by(email: forgot_password_params[:email])
    if !resource
      render json: { error: "Couldn't find a user with that email." }, status: :unprocessable_entity and return
    end
    # send_reset_password_instructions returns the token sent in the email
    token = resource.send_reset_password_instructions

    if successfully_sent?(resource)
      render json: { user: resource }, status: :ok
    else
      render json: { error: "Failed to send password reset email." }, status: :unprocessable_entity
    end
  end

  def update
    # Attempt to find a user by its reset_password_token to reset its password.
    # If a user is found and token is still valid, reset its password
    # params must contain reset_password_token, password and confirmation
    resource = resource_class.reset_password_by_token(reset_password_params)

    if resource.errors.empty?
      unless resource.confirmed?
        resource.confirm
      end

      render json: { user: resource }, status: :ok
    else
      set_minimum_password_length
      render json: { error: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def forgot_password_params
    params.permit(:email)
  end

  def reset_password_params
    params.permit(:reset_password_token, :password, :password_confirmation)
  end
end
