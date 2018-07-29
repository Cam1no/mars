require 'rails_helper'

describe 'photos' do
  describe 'photos#index' do
    context 'normal' do
      let!(:photos) { create_list(:photo, 2) }

      before { get photos_path }

      it { expect(response).to have_http_status(200) }
      it { expect(response.content_type).to eq('application/json') }
      it { expect(json[:data].class).to eq(Array) }
      it { expect(photos.pluck(:id)).to include(json[:data][0][:id].to_i) }
    end
  end
end