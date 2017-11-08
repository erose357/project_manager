class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects

  has_one :original_budget

  validates_presence_of :name

  def address
    "#{street}, #{city}, #{state} #{zip}"
  end

  #TEMP methods, for now

  def original_sf 
    @original_sf || 0
  end

  def revised_sf
    @revised_sq || 0
  end

  def orig_lf_sf
    @orig_lf_sf || 0
  end
  
  def rev_lf_sf
    @rev_lf_sf || 0
  end
end
