require 'rails_helper'

RSpec.describe "Authenticated user" do
  let (:user) { create(:user) }
  let (:projects) { create_list(:project, 3) }

  context "creates original project budget" do
    it "sees original budget form" do
      user.projects << projects

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/projects/#{projects[0].id}"

      click_on "Set Original Budget"

      expect(current_path).to eq(new_original_budget_path)
    end
  end
end
