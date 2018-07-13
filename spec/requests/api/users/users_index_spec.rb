require "rails_helper"

describe "api::users#index", type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  it "should respond with success" do
    get "/api/users", headers: @headers
    expect(response).to have_http_status(:ok)
  end
end
