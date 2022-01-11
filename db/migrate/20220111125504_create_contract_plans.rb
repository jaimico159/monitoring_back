class CreateContractPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_plans do |t|
      t.references :contract, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :slot_duration
      t.integer :time_slots_count

      t.timestamps
    end
  end
end
