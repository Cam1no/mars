require 'tinby'

class TinderFetcher
  attr_reader :tinby

  def initialize
    @tinby = Tinby::Client.new(ENV['TINDER_EMAIL'], ENV['TINDER_PASSWORD'])
  end

  def call
    tinby.recommended_users.each do |user|
      ActiveRecord::Base.transaction do
        tinder_user = TinderUser.create!(tinder_user_params(user))
        user['photos'].each { |photo| tinder_user.photos.create!(tinder_photo_params(photo)) }
        tinby.like(user['_id'])
      end
    end
  end

  private

  def tinder_user_params(user)
    {
      tinder_id: user['_id'],
      name: user['name'],
      bio: user['bio'].to_s,
      distance_mi: user['distance_mi'],
      birth_date: user['birth_date'],
      instagram_user_name: user['instagram'].try(:[], 'username')
    }
  end

  def tinder_photo_params(photo)
    { url: photo['processedFiles'][0]['url'] }
  end
end
