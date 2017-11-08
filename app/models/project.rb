class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects, dependent: :destroy

  has_one :original_budget

  validates_presence_of :name

  def address
    "#{street}, #{city}, #{state} #{zip}"
  end
end
