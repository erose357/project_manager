class OriginalBudgetController < ApplicationController
  def new
    @original_budget = OriginalBudget.new({project_id: params[:project_id]}) 
  end
end
