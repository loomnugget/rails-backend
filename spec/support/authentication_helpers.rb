module AuthenticationHelper

  def find_or_create_default_user
    user = User.find_by(first_name: "Default", last_name: "User")
    user = FactoryBot.create(:user, first_name: "Default", last_name: "User") if !user
    return user
  end

  def sign_in_user(user = nil)
    sign_out_user

    @current_user ||= user
    @current_user ||= find_or_create_default_user
    @headers = @current_user.create_new_auth_token
  end

  def sign_out_user
    @current_user = nil
    @headers = nil
  end

end
