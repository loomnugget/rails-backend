require "rails_helper"

describe "api::messages#destroy", type: :request do
  let!(:message) { create(:message) }

  it "should respond with success" do
    delete "/api/messages/#{message.id}", headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it "should delete the message" do
    delete "/api/messages/#{message.id}", headers: @headers
    expect(Message.find_by_id(message.id)).to be_nil
  end
end
