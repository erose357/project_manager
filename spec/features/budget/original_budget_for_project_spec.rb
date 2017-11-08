require 'rails_helper'

RSpec.describe "Authenticated user" do
  let (:user) { create(:user) }
  let (:project) { create(:project) }

  context "see original project budget form" do
    it "sees original budget form" do
      user.projects << project

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/projects/#{project.id}"

      click_on "Original Budget"

      expect(current_path).to eq(new_project_original_budget_path(project))
      expect(page).to have_content("Purchase Price")
      expect(page).to have_content("SF for Construction")
      expect(page).to have_content("SF for Landscaping")
    end

    it "creates an original project budget" do
      user.projects << project

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/projects/#{project.id}"

      click_on "Original Budget"

      expect(current_path).to eq(new_project_original_budget_path(project))
      
      fill_in "Purchase Price", with: 1000000
      fill_in "SF for Construction", with: 10000
      fill_in "SF for Landscaping", with: 20000
      click_on "Create Budget"

      new_budget = OriginalBudget.last

      expect(current_path).to eq(project_path(project))
      expect(new_budget.purchase_price).to eq(1000000)
      expect(new_budget.sf_construction).to eq(10000)
      expect(new_budget.sf_landscape).to eq(20000)
    end
  end
end

