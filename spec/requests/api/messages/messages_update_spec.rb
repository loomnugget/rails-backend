require "rails_helper"

describe "api::messages#update", type: :request do
  let!(:message) { create(:message) }
  let(:default_params) {{ message: { content: "new content" } }}

  it "should respond with success" do
    put "/api/messages/#{message.id}", params: default_params, headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it "should update the message content" do
    put "/api/messages/#{message.id}", params: default_params, headers: @headers
    expect(message.reload.content).to eq("new content")
  end
end
