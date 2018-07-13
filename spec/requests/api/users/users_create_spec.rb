require "rails_helper"

describe "api::users#create", type: :request do
  let(:default_params) {{ user: {
    first_name: "Test First",
    last_name: "Test Last",
    email: "test1@test.com",
    password: "test123",
    password_confirmation: "test123"
  } }}

  it "should respond with success" do
    post "/api/users", params: default_params
    expect(response).to have_http_status(:ok)
  end

  # it "should create a user" do
  #   expect{
  #     post "/api/users", params: default_params
  #   }.to change(User, :count).by(1)
  # end
end
