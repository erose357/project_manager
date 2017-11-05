class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects

  validates_presence_of :name
end
