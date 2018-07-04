require 'rails_helper'

RSpec.describe UserService::CreateUser, :type => :model do
  let!(:create_service) { UserService::CreateUser }
  let!(:params) {{ first_name: "test", last_name: "test", password: "password", password_confirmation: "password", email: "test@test.com" }}

  describe "success" do
    it "should return a user" do
      service = create_service.new(params).call
      expect(service).to be_kind_of(User)
    end

    it "should create a new user" do
      service = create_service.new(params)
      expect { service.call }.to change(User, :count).by(1)
    end
  end
end
