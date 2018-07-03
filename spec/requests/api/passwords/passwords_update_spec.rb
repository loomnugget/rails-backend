require "rails_helper"

describe "api::passwords#create", type: :request do
  let!(:user) { create :user }
  let!(:old_password) { user.encrypted_password }

  it "should respond with success" do
    reset_password_token = user.send_reset_password_instructions

    params = {
      reset_password_token: reset_password_token,
      password: "newpassword",
      password_confirmation: "newpassword"
    }

    put api_reset_password_path, params: params

    expect(response).to have_http_status(:ok)
    expect(user.reload.encrypted_password).to_not eq(old_password)
    expect(user).to be_confirmed
  end

  it "should fail if no token is present/invalid" do
    invalid_params = {
      reset_password_token: "",
      password: "newpassword",
      password_confirmation: "newpassword"
    }

    put api_reset_password_path, params: invalid_params
    
    expect(response).to have_http_status(:unprocessable_entity)
    expect(user.reload.encrypted_password).to eq(old_password)
  end
end
