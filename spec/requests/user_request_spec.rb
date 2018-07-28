require 'rails_helper'

describe 'users' do
  describe 'users#index' do
    context 'normal' do
      let!(:users) { create_list(:tinder_user, 2) }

      before { get users_path }

      it { expect(response).to have_http_status(200) }
      it { expect(response.content_type).to eq('application/json') }
      it { expect(json[:data].class).to eq(Array) }
      it { expect(users.pluck(:id)).to include(json[:data][0][:id].to_i) }
    end
  end

  describe 'users#show' do
    context 'normal' do
      let!(:user) { create(:tinder_user) }
      let(:params) { { id: user.id } }

      before { get user_path(params) }

      it { expect(response).to have_http_status(200) }
      it { expect(response.content_type).to eq('application/json') }
      it { expect(json[:data].class).to eq(Hash) }
      it { expect(json[:data][:id].to_i).to eq(user.id) }
    end
    context 'abnormal' do
      let(:params) { { id: 99999999 } }

      before { get user_path(params) }

      it { expect(response).to have_http_status(404) }
    end
  end
end