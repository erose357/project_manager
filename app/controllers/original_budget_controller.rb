class OriginalBudgetController < ApplicationController
  def edit 
    @project = Project.find(params[:project_id])
  end

  def update
    @original_budget = OriginalBudget.find(params[:id])
    if @original_budget.update(original_budget_params)
      flash[:notice] = "Budget Updated"
      redirect_to project_path(@original_budget.project)
    else
      render :edit
    end
  end

  private
    def original_budget_params
      params.require(:original_budget).permit(:purchase_price, :sf_construction, :sf_landscape)
    end
end
