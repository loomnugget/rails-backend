class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead. (with: :null_session)
  protect_from_forgery with: :null_session

  before_action :authenticate_user!

  # For Rails 5, note that protect_from_forgery is no longer prepended to the before_action chain,
  # so if you have set authenticate_user before protect_from_forgery, your request will result
  # in "Can't verify CSRF token authenticity." To resolve this, either change the order in which you
  # call them, or use protect_from_forgery prepend: true.
end
