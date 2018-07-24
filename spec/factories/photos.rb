FactoryBot.define do
  factory :photo do
    association :tinder_user
    url { Faker::Internet.url + ['.jpg', '.png'].sample }
  end
end
