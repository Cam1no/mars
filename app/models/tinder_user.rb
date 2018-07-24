# == Schema Information
#
# Table name: tinder_users
#
#  id                  :bigint(8)        not null, primary key
#  tinder_id           :string(255)      not null
#  name                :string(255)      not null
#  bio                 :text(65535)      not null
#  instagram_user_name :string(255)
#  birth_date          :date
#  distance_mi         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class TinderUser < ApplicationRecord
  validates :tinder_id, :name, :bio, presence: true
end
