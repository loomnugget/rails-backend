require "rails_helper"

describe "api::messages#index", type: :request do
  let!(:message) { create(:message) }

  it "should respond with success" do
    get "/api/messages", headers: @headers
    expect(response).to have_http_status(:ok)
  end
end
