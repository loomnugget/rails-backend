require "rails_helper"
# The authentication header looks something like this:
# { "access-token"=>"abcd1dMVlvW2BT67xIAS_A",
#   "token-type"=>"Bearer",
#   "client"=>"LSJEVZ7Pq6DX5LXvOWMq1w",
#   "expiry"=>"1519086891",
#   "uid"=>"test@test.com" }

describe "auth#sign_in", type: :request do
  let!(:user) { create(:user, email: "test@bmail.com") }
  let!(:default_params) {{ email: user.email, password: "password" }}
  let!(:invalid_params) {{ email: user.email, password: "badpassword" }}
  let!(:default_headers) {{ 'CONTENT_TYPE' => "application/json", "ACCEPT" => "application/json" }}

  it "responds with unauthorized if password is wrong" do
    post api_user_session_path, params: invalid_params.to_json, headers: default_headers
    expect(response.status).to eq(401)
  end

  it "should respond with success" do
    post api_user_session_path, params: default_params.to_json, headers: default_headers
    expect(response).to have_http_status(:ok)
  end

  it "should have the access token in the headers" do
    post api_user_session_path, params: default_params.to_json, headers: default_headers
    expect(response.has_header?('access-token')).to eq(true)
  end

end
