require 'rails_helper'

RSpec.describe "Authenticated user" do
  let (:user) { create(:user) } 
  let (:projects) { create_list(:project, 3) } 

  scenario "creates a new project" do

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

  scenario "views project show page" do
    user.projects << projects

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects"

    expect(current_path).to eq("/projects")
    expect(page).to have_link(projects[0].name)
    expect(page).to have_link(projects[1].name)
    expect(page).to have_link(projects[2].name)

    click_link "#{projects[1].name}"

    expect(current_path).to eq(project_path(projects[1]))
  end

  scenario "clicks on badge link and gets redirected to projects path" do
    user.projects << projects

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects"

    expect(current_path).to eq(projects_path)

    click_on "#{projects[0].name}"

    expect(current_path).to eq(project_path(projects[0]))

    click_on "PM"

    expect(current_path).to eq(projects_path)
    expect(page).to have_content("My Projects")
    expect(page).to have_link(projects[0].name)
    expect(page).to have_link(projects[1].name)
    expect(page).to have_link(projects[2].name)
  end
end
