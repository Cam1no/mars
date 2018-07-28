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

class Photo < ApplicationRecord
  validates :url, presence: true
  validate  :check_image

  belongs_to :tinder_user

  private

  def check_image
    return if ['.jpg', '.jpeg', '.png', '.gif'].include?(File.extname(url).downcase)
    errors.add(:photo, 'jpg, jpeg, png, gifのみアップロードできます。')
  end
end
