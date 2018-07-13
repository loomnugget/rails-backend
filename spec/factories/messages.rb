FactoryBot.define do
  factory :message do
    content 'test'
    association :user
  end
end
