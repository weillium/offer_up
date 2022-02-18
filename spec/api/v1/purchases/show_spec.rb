require 'rails_helper'

RSpec.describe "purchases#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/purchases/#{purchase.id}", params: params
  end

  describe 'basic fetch' do
    let!(:purchase) { create(:purchase) }

    it 'works' do
      expect(PurchaseResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('purchases')
      expect(d.id).to eq(purchase.id)
    end
  end
end
