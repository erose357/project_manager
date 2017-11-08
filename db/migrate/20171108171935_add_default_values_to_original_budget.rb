class AddDefaultValuesToOriginalBudget < ActiveRecord::Migration[5.1]
  def change
    change_column :original_budgets, :purchase_price, :integer, default: 0, null: false
    change_column :original_budgets, :sf_construction, :integer, default: 0, null: false
    change_column :original_budgets, :sf_landscape, :integer, default: 0, null: false
  end
end
