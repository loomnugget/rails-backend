require "rails_helper"

describe "api::passwords#create", type: :request do
  let!(:user) { create :user, email: 'test1234@shepherdapp.com' }

  it "should respond with success" do
    post api_generate_new_password_email_path, params: { email: user.email }
    expect(response).to have_http_status(:ok)
  end

  it "should return an error if no email" do
    post api_generate_new_password_email_path, params: { email: '' }
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
