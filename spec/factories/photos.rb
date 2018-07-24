# == Schema Information
#
# Table name: photos
#
#  id             :bigint(8)        not null, primary key
#  tinder_user_id :bigint(8)        not null
#  url            :text(65535)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :photo do
    association :tinder_user
    url { Faker::Internet.url + ['.jpg', '.png'].sample }
  end
end
