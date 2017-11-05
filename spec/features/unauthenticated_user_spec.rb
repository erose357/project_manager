require 'rails_helper'

RSpec.describe "Unauthenticated user" do
  scenario "clicks the badge link" do

    visit '/'

    click_on "PM"

    expect(current_path).to eq(root_path)
  end
end
