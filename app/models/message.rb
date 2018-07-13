class Message < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  belongs_to :user
end
