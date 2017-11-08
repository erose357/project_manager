require 'rails_helper'

RSpec.describe OriginalBudget, type: :model do
  let (:original_budget) { create(:original_budget) }
  describe "Validations" do
    it { is_expected.to validate_presence_of(:project_id) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:project) }
  end

  context "Instance methods" do
    it "#closing_costs" do
      expect(original_budget.closing_costs).to eq(45000)
    end

    it "#subtotal_purchase" do
      expect(original_budget.subtotal_purchase).to eq(1545000)
    end

    it "#purchase_cost_per_sf" do
      expect(original_budget.purchase_cost_per_sf).to eq(154.5)
    end
  end
end
