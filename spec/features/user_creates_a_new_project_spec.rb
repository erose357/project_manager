require 'rails_helper'

RSpec.describe "Authenticated user" do
  scenario "creates a new project" do
    user = create(:user)
#As an authenticated user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#when I visit my dashboard page
    visit "/projects"
#and I click on 'new project'
    click_on 'New Project'
#I am redirected to the projects new page
    expect(current_path).to be('/projects/new')
#And I enter a project name
    fill_in "Name", with: "Tenant Improvement"
    fill_in "Street", with: "1234 Big Street"
    fill_in "City", with: "Old Victory"
    fill_in "State", with: "CO"
    fill_in "Zip", with: 12345
#And I click 'create'
    click_on 'Create Project'
#I am redirected to my dashboard
    expect(current_path).to eq('/projects')
#And I see the new project in my project list
    expect(page).to have_link("Tenant Improvement")
  end
end
