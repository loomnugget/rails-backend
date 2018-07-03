require "rails_helper"

describe "api::users#index", type: :request do
  let!(:user) { create(:user, email: "test@bmail.com") }
  let!(:user2) { create(:user, email: "test2@bmail.com") }

  it "should respond with success" do
    get "/api/users"
    expect(response).to have_http_status(:ok)
  end
end
