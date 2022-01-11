class AddTimeSlotsToContractPlans < ActiveRecord::Migration[7.0]
  def change
    add_reference :time_slots, :contract_plan, foreign_key: true
    add_column :time_slots, :engineer_id, :integer
    add_index :time_slots, :engineer_id
  end
end
