require "rails_helper"

describe "api::messages#create", type: :request do
  let!(:user) { create(:user) }
  let(:default_params) {{ message: {
    user_id: user.id,
    content: "this is a message"
  } }}

  it "should respond with success" do
    post "/api/messages", params: default_params, headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it "should create a message" do
    expect{
      post "/api/messages", params: default_params, headers: @headers
    }.to change(Message, :count).by(1)
  end
end
