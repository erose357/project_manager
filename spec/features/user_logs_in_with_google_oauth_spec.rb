require 'rails_helper'

RSpec.feature "User logs in" do
  scenario "with google oauth" do
    stub_omniauth
    visit '/'

    expect(page).to have_link("Login")

    click_link "Login"

    expect(current_path).to eq("/login")

    expect(page).to have_content("Login with Google")
   
    click_link "Login with Google"

    expect(page).to have_content("Jeff Lebowski")
    expect(current_path).to eq(projects_path)
    expect(page).to have_link("Logout")
    
    click_link "Logout"

    expect(current_path).to eq(root_path)
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = 
    OmniAuth::AuthHash.new ({
      provider: "google",
      uid: "123456789",
      info: {
        name: "Jeff Lebowski",
        email: "thedude@worthyadversary.com",
        image: "https://i.pinimg.com/736x/66/b0/a1/66b0a10f18f70dfd5cb41a4e35c90234--funny-happy-birthday-meme-birthday-memes.jpg"
      },
      credentials: {
        token: "abcdefghijk",
        refresh_token: "123456abcdefg",
        expires_at: DateTime.now
      }
  })
end
