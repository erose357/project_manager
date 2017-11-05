class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects

  validates_presence_of :provider, :uid, :name, :token
  validates_uniqueness_of :uid

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
