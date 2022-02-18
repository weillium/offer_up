require 'rails_helper'

RSpec.describe "purchases#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/purchases/#{purchase.id}"
  end

  describe 'basic destroy' do
    let!(:purchase) { create(:purchase) }

    it 'updates the resource' do
      expect(PurchaseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Purchase.count }.by(-1)
      expect { purchase.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
