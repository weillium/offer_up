require "rails_helper"

RSpec.describe ItemResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "items",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ItemResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Item.count }.by(1)
    end
  end

  describe "updating" do
    let!(:item) { create(:item) }

    let(:payload) do
      {
        data: {
          id: item.id.to_s,
          type: "items",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ItemResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { item.reload.updated_at }
      # .and change { item.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:item) { create(:item) }

    let(:instance) do
      ItemResource.find(id: item.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Item.count }.by(-1)
    end
  end
end
