# require 'uri'
# require 'net/http'

module UserService
  class VerifyRecaptcha
    attr_reader :recaptcha_response
    RECAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify"

    def initialize(recaptcha_response)
      @recaptcha_response = recaptcha_response
    end

    def call
      verify_recaptcha
    end

    private

    def verify_recaptcha
      return true unless Rails.configuration.x.enable_recaptcha
      url = URI.parse(RECAPTCHA_URL)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      response = http.post(
        url.request_uri,
        "secret=#{ENV["RECAPTCHA_SECRET_KEY"]}&response=#{recaptcha_response}"
      )

      JSON.parse(response.body)["success"].to_s != "false"
    end

  end
end
