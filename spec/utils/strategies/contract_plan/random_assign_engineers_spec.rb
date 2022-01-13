require 'rails_helper'

RSpec.describe Strategies::ContractPlan::RandomAssignEngineers do
  context 'A contract plan day has many time slots which at the same time have reservations'
  let!(:options) do
    {
      1 => { start_at: 19,
             end_at: 24 },
      2 => { start_at: 19,
             end_at: 24 },
      3 => { start_at: 19,
             end_at: 24 },
      4 => { start_at: 19,
             end_at: 24 },
      5 => { start_at: 19,
             end_at: 24 },
      6 => { start_at: 10,
             end_at: 24 },
      0 => { start_at: 10,
             end_at: 24 }
    }
  end
  describe '#run' do
    it 'assigns at least one engineer to time slot if time slot has reservations' do
      contract = create(:contract)
      builder = Builders::Contract::ContractPlanBuilder
                .new(contract: contract, from: Date.today,
                     to: Date.today.tomorrow, options: options)

      builder.build

      create_list(:engineer, 5)
      contract.engineers = Engineer.all
      contract.save

      engineers_ids = contract.engineers.ids
      time_slots_ids = contract.time_slots.ids

      reservations = []
      time_slots_ids.map do |ts|
        reservations << Reservation.create(engineer_id: engineers_ids.sample, time_slot_id: ts) if [true,
                                                                                                    false].sample
      end

      contract_plan = contract.contract_plans.first

      strategy = Strategies::ContractPlan::RandomAssignEngineers.new(contract_plan_id: contract_plan.id)
      strategy.run

      test_time_slots = contract_plan.time_slots
      test_time_slots.each do |test_time_slot|
        expect(test_time_slot.engineer_id).to_not eq(nil) if test_time_slot.reservations.length.positive?
      end
    end
  end
end
