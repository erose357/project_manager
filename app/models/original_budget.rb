class OriginalBudget < ApplicationRecord
  belongs_to :project

  validates_presence_of :project_id
  
  def closing_costs
    if purchase_price == 0
      0
    else
      purchase_price * 0.03
    end
  end

  def subtotal_purchase
    purchase_price + closing_costs
  end

  def purchase_cost_per_sf
    if sf_construction > 0
      subtotal_purchase / sf_construction
    end
  end
end
