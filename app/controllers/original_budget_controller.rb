class OriginalBudgetController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @original_budget = OriginalBudget.new
  end

  def create
    @original_budget = OriginalBudget.new(original_budget_params)
    @original_budget.project_id = params[:project_id]
    if @original_budget.save
      flash[:notice] = "Original Budget Created"
      redirect_to project_path(params[:project_id])
    else
      render :new
    end
  end

  private
    def original_budget_params
      params.require(:original_budget).permit(:purchase_price, :sf_construction, :sf_landscape, :project_id)
    end
end
