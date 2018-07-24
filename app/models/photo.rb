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
