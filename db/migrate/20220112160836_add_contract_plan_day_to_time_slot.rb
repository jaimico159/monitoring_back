class AddContractPlanDayToTimeSlot < ActiveRecord::Migration[7.0]
  def change
    add_reference :time_slots, :contract_plan_day, foreign_key: true
  end
end
