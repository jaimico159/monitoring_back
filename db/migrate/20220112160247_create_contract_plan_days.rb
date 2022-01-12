class CreateContractPlanDays < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_plan_days do |t|
      t.date :current_date
      t.references :contract_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
