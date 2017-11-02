require 'rails_helper'

RSpec.describe User do
  context "creates a user" do
    it "from google login" do
      auth = {
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
  }
      User.update_or_create(auth)
      new_user = User.first

      expect(new_user.provider).to eq("google")
      expect(new_user.uid).to eq("123456789")
      expect(new_user.email).to eq("thedude@worthyadversary.com")
      expect(new_user.image).to eq("https://i.pinimg.com/736x/66/b0/a1/66b0a10f18f70dfd5cb41a4e35c90234--funny-happy-birthday-meme-birthday-memes.jpg")
      expect(new_user.token).to eq("abcdefghijk")
      expect(new_user.refresh_token).to eq("123456abcdefg")
      expect(new_user.expires_at).to eq(auth[:credentials][:expires_at])
    end
  end
end
