require "rails_helper"

RSpec.describe PurchaseResource, type: :resource do
  describe "serialization" do
    let!(:purchase) { create(:purchase) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(purchase.id)
      expect(data.jsonapi_type).to eq("purchases")
    end
  end

  describe "filtering" do
    let!(:purchase1) { create(:purchase) }
    let!(:purchase2) { create(:purchase) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: purchase2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([purchase2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:purchase1) { create(:purchase) }
      let!(:purchase2) { create(:purchase) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      purchase1.id,
                                      purchase2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      purchase2.id,
                                      purchase1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
