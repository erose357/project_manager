class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects

  validates_presence_of :name

  def address
    "#{street}, #{city}, #{state} #{zip}"
  end

  def original_sf 
    @original_sf || 0
  end

  def revised_sf
    @revised_sq || 0
  end
end
