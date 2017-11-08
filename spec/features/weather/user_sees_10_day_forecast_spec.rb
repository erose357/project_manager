require 'rails_helper'

RSpec.describe "Authenticated User" do
  let (:user) { create(:user) }
  let (:projects) { create_list(:project) }
  let (:project) { create(:project) }

  scenario "sees 10 day forecast" do
    VCR.use_cassette("weather") do
      user.projects << project

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "projects/#{project.id}"

      expect(current_path).to eq(project_path(project.id))

      click_on "Weather"

      expect(current_path).to eq(project_weather_index_path(project.id))
      expect(page).to have_css(".weekday")
      expect(page).to have_css(".city")
      expect(page).to have_css(".date")
      expect(page).to have_css(".high")
      expect(page).to have_css(".low")
      expect(page).to have_css(".conditions")
    end
  end
end
