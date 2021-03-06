require 'rails_helper'

RSpec.describe Project, type: :model do
  let (:project) { create(:project) }

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_one(:original_budget) }
  end

  describe "Instance methods" do
    it "#address" do
      expect(project.address).to eq("1234 Street Blvd, Disneyland, CA 92799")
    end
  end
end
