require "rails_helper"

RSpec.describe PurchaseResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "purchases",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PurchaseResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Purchase.count }.by(1)
    end
  end

  describe "updating" do
    let!(:purchase) { create(:purchase) }

    let(:payload) do
      {
        data: {
          id: purchase.id.to_s,
          type: "purchases",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PurchaseResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { purchase.reload.updated_at }
      # .and change { purchase.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:purchase) { create(:purchase) }

    let(:instance) do
      PurchaseResource.find(id: purchase.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Purchase.count }.by(-1)
    end
  end
end
