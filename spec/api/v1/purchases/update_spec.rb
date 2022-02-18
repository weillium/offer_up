require "rails_helper"

RSpec.describe "purchases#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/purchases/#{purchase.id}", payload
  end

  describe "basic update" do
    let!(:purchase) { create(:purchase) }

    let(:payload) do
      {
        data: {
          id: purchase.id.to_s,
          type: "purchases",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PurchaseResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { purchase.reload.attributes }
    end
  end
end
