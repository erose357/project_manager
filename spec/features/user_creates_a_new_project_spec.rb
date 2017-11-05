require 'rails_helper'

RSpec.describe "Authenticated user" do
  scenario "creates a new project" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects"

    click_on 'New Project'

    expect(current_path).to eq('/projects/new')

    fill_in "Name", with: "Tenant Improvement"
    fill_in "Street", with: "1234 Big Street"
    fill_in "City", with: "Old Victory"
    fill_in "State", with: "CO"
    fill_in "Zip", with: 12345

    click_on 'Create Project'

    expect(current_path).to eq('/projects')

    expect(page).to have_link("Tenant Improvement")
  end
end
