require 'rails_helper'

RSpec.describe "Projects show page" do
  let (:user) { create(:user) }
  let (:projects) { create_list(:project, 3) }

  scenario "user sees project info header on show page" do
    user.projects << projects

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects/#{projects[1].id}"

    expect(page).to have_content("Project Description")
    expect(page).to have_content(projects[1].name)
    expect(page).to have_content(projects[1].address)
    expect(page).to have_content("Square Footage to be Built/Renovated:")
    expect(page).to have_content("Square Footage for Parking/Landscaping")
    expect(page).to have_content("Category")
    expect(page).to have_content("Original Budget")
    expect(page).to have_content("Revised Budget")
    expect(page).to have_content("Estimated Costs")
    expect(page).to have_content("Bid Award")
    expect(page).to have_content("Bids Est")
    expect(page).to have_content("Chg Ord")
    expect(page).to have_content("Total")
    expect(page).to have_content("Remaining Budget")
    expect(page).to have_content("Requisitioned Costs")
    expect(page).to have_content("Invoiced")
    expect(page).to have_content("Balance")
  end

  scenario "user sees project costs section" do
    user.projects << projects

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects/#{projects[1].id}"

    expect(current_path).to eq(project_path(projects[1].id))
    expect(page).to have_content("Purchase Costs")
    expect(page).to have_content("Purchase Price")
    expect(page).to have_content("Closing Costs")
    expect(page).to have_content("Other")
    expect(page).to have_content("Subtotal Purchase")
    expect(page).to have_content("Cost per square foot")
  end

  scenario "user sees construction/renovation costs" do
    user.projects << projects

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects/#{projects[1].id}"

    expect(current_path).to eq(project_path(projects[1].id))
    expect(page).to have_content("Construction/Renovation(Cost per sf")
    expect(page).to have_content("Build-out Type:")
    expect(page).to have_content("Finishes($10/sf")
    expect(page).to have_content("New HVAC(if needed, $15/sf)")
    expect(page).to have_content("Elevator(if needed)")
    expect(page).to have_content("Exterior Parking and Landscaping")
    expect(page).to have_content("Exterior Painting or Resurfacing($2.00/sf)")
    expect(page).to have_content("Soft Costs(10%)")
    expect(page).to have_content("Other")
    expect(page).to have_content("Subtotal Construction/Renovation")
    expect(page).to have_content("Cost per square foot")
  end

  scenario "user sees FFE costs" do
    user.projects << projects

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects/#{projects[0].id}"

    expect(current_path).to eq(project_path(projects[0].id))
    expect(page).to have_content("Furniture, Fixt, & Equip(Cost per sf)")
    expect(page).to have_content("AV Cabling & Equip")
    expect(page).to have_content("Signage")
    expect(page).to have_content("Security")
    expect(page).to have_content("Kitchen Equip")
    expect(page).to have_content("Office Equip")
    expect(page).to have_content("Misc")
    expect(page).to have_content("Other")
    expect(page).to have_content("Subtotal FFE")
    expect(page).to have_content("Cost per square foot")
  end

  scenario "user sees subtotal and project summary costs" do
    user.projects << projects

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/projects/#{projects[2].id}"

    expect(current_path).to eq(project_path(projects[2].id))
    expect(page).to have_content("Subtotal Const/Renovation/FFE Costs")
    expect(page).to have_content("Cost per square foot")
    expect(page).to have_content("Subtotal Purchase Costs")
    expect(page).to have_content("Subtotal Const/Renovation/FEE Costs")
    expect(page).to have_content("Project Contingency(15% Const&FFE")
    expect(page).to have_content("Total Project Costs")
    expect(page).to have_content("Cost per square foot")
  end
end

