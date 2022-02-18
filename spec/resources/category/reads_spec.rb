require "rails_helper"

RSpec.describe CategoryResource, type: :resource do
  describe "serialization" do
    let!(:category) { create(:category) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(category.id)
      expect(data.jsonapi_type).to eq("categories")
    end
  end

  describe "filtering" do
    let!(:category1) { create(:category) }
    let!(:category2) { create(:category) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: category2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([category2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:category1) { create(:category) }
      let!(:category2) { create(:category) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      category1.id,
                                      category2.id,
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
                                      category2.id,
                                      category1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
