require "rails_helper"

describe "api::users#update", type: :request do
  let!(:user) { create(:user) }
  let(:default_params) {{ user: { first_name: "changed" } }}

  it "should respond with success" do
    put "/api/users/#{user.id}", params: default_params, headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it "should update the user's first name" do
    put "/api/users/#{user.id}", params: default_params, headers: @headers
    expect(user.reload.first_name).to eq("changed")
  end
end
