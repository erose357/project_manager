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
    #category, original budget, revised budget, estimated costs(bid award, bids expected, change order, total), remaining budget, requisitioned costs(invoiced to date, balance due)
  end
end

