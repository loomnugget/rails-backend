require "rails_helper"

describe "auth#password/new", type: :request do
  before(:each) do
    sign_in_user
  end

  it "should respond with success" do
    post "/api/auth/password", params: { email: @current_user.email }
    # p JSON.parse(response.body)
    # expect(response).to have_http_status(:ok)
  end

  # it "should return an error if no email" do
  #   post api_v1_generate_new_password_email_path, { email: '' }
  #   expect(response).to have_http_status(:unprocessable_entity)
  # end
end
