require 'rails_helper'

RSpec.describe UserService::VerifyRecaptcha, :type => :model do
  let!(:service) { UserService::VerifyRecaptcha }
  let!(:recaptcha_response) { "test-captcha-code" }

  describe "success" do
    before do
      status = {:body => '{ "success": true }'}
      stub_request(:post, UserService::VerifyRecaptcha::RECAPTCHA_URL).to_return(status)
    end

    it "should return true" do
      response = service.new(recaptcha_response).call
      expect(response).to eq(true)
    end
  end

  describe "failure" do
    before do
      status = {:body => '{ "success": false }'}
      stub_request(:post, UserService::VerifyRecaptcha::RECAPTCHA_URL).to_return(status)
    end

    it "should return false" do
      response = service.new(recaptcha_response).call
      expect(response).to eq(false)
    end
  end

end
