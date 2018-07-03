require "rails_helper"

describe "auth#sign_out", type: :request do

  before(:each) do
    sign_in_user
  end

  it "should respond with success" do
    delete destroy_api_user_session_path, headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it "should remove the access token from the headers" do
    delete destroy_api_user_session_path, headers: @headers
    expect(response.has_header?('access-token')).to eq(false)
  end

end
