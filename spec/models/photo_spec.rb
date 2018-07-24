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

require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'factory' do
    it { expect( build_stubbed(:photo) ).to be_valid }
  end

  describe 'association' do
    it { is_expected.to belong_to(:tinder_user) }
  end

  describe 'validate' do
    let(:options) { {} }
    subject { build_stubbed(:photo, options) }

    context 'normal' do
      it { is_expected.to be_valid }
    end
    context 'abnormal' do
      ['.zip', '.mp3', '.txt'].each do |extension|
        let(:options) { { url: Faker::Internet.url + extension } }
        it { is_expected.to be_invalid }
      end
    end
  end
end
