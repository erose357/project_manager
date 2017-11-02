class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      name: auth[:info][:name],
      email: auth[:info][:email],
      image: auth[:info][:image],
      token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token],
      expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    user
  end
end
