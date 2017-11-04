require 'rails_helper'

RSpec.feature "Authenticated user" do
  scenario "sees their dashboard page with a list of projects" do
    user = create(:user)
    projects = create_list(:project, 3, user_id: user.id)
#As a user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#When I login
    visit '/dashboard'
#I see my dashboard page
    expect(current_path).to eq(dashboard_path)
#with a list of my projects 
    expect(page).to have_css(".project_name", count: 3)
#and links to each project
    expect(page).to have_link(projects[0].name)
    expect(page).to have_link(projects[1].name)
    expect(page).to have_link(projects[2].name)
  end
end
