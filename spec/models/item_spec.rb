require "rails_helper"

RSpec.describe Item, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:category) }

    it { should have_many(:purchases) }

    it { should have_many(:comments) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
