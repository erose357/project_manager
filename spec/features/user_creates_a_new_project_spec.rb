require 'rails_helper'

RSpec.describe "Authenticated user" do
  let (:user) { create(:user) } 
  let (:project) { create(:project) } 
  let (:original_budget) { create(:original_budget, project_id: project.id) }

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
    original_budget
    user.projects << project

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects"

    expect(current_path).to eq("/projects")
    expect(page).to have_link(project.name)
    expect(page).to have_link(project.name)
    expect(page).to have_link(project.name)

    click_link "#{project.name}"

    expect(current_path).to eq(project_path(project))
  end

  scenario "clicks on badge link and gets redirected to projects path" do
    original_budget
    user.projects << project

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects"

    expect(current_path).to eq(projects_path)

    click_on "#{project.name}"

    expect(current_path).to eq(project_path(project))

    click_on "PM"

    expect(current_path).to eq(projects_path)
    expect(page).to have_content("My Projects")
    expect(page).to have_link(project.name)
    expect(page).to have_link(project.name)
    expect(page).to have_link(project.name)
  end
end
