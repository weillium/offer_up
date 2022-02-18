require "rails_helper"

RSpec.describe "purchases#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/purchases", params: params
  end

  describe "basic fetch" do
    let!(:purchase1) { create(:purchase) }
    let!(:purchase2) { create(:purchase) }

    it "works" do
      expect(PurchaseResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["purchases"])
      expect(d.map(&:id)).to match_array([purchase1.id, purchase2.id])
    end
  end
end
