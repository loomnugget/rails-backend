FactoryBot.define do
  factory :user do
    confirmed_at Time.now
    first_name "test"
    last_name "test"
    sequence(:email) { |n| "test_#{n}@example.com" }
    password "test123"
    password_confirmation "test123"
  end
end
