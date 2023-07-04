require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let(:user) { create :user }
  let(:json_response_body) { JSON.parse(response.body) }

  describe 'GET #show' do
    context 'when params are valid' do
      before { get :show, params: { id: user.id } }

      it do
        expect(response).to be_ok
        expect(response.body).to eq(user.as_json)
      end
    end

    context 'when user was not found' do
      before { get :show, params: { id: 'Invalid' } }

      it do
        expect(response).to be_not_found
        expect(response.body).to eq(user.as_json)
      end
    end
  end

  describe 'PUT #update' do
    let(:params) { { first_name: Faker::Name.first_name } }

    context 'when params are valid' do
      before { put :update, params: { id: user.id, user: { first_name: name } } }

      it do
        expect(response).to be_ok
        expect(user.reload.first_name).to eq(params[:first_name])
      end
    end

    context 'when params are invalid' do
      before { put :update, params: { id: user.id, user: { first_name: nil } } }

      it { expect(response).to be_unprocessable_entity }
    end

    context 'when user was not found' do
      before { put :show, params: { id: 'Invalid' } }

      it do
        expect(response).to be_not_found
        expect(response.body).to eq(user.as_json)
      end
    end
  end
end
