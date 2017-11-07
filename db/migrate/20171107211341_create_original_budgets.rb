class CreateOriginalBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :original_budgets do |t|
      t.integer :purchase_price
      t.integer :sf_construction
      t.integer :sf_landscape
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
