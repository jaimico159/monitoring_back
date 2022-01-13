require 'rails_helper'

RSpec.describe Builders::Contract::ContractPlanBuilder do
  context 'Creating instance with correct params' do
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

    describe '::new' do
      it 'retrieves an instance of class' do
        contract = create(:contract)
        builder =
          Builders::Contract::ContractPlanBuilder
          .new(contract: contract, from: Date.today,
               to: Date.today.tomorrow, options: options)
        expect(builder).to be_a(Builders::Contract::ContractPlanBuilder)
      end
    end

    describe '::build' do
      it 'Creates contract plans with time slots and contract plan days in range' do
        contract = create(:contract)
        start_date = Date.today.beginning_of_week
        end_date = (start_date + 2.weeks).end_of_week
        builder = Builders::Contract::ContractPlanBuilder
                  .new(contract: contract, from: start_date,
                       to: end_date, options: options)

        plans_count = ((end_date - start_date).to_i + 1) / 7
        time_slots_count = options.map { |_k, v| v[:end_at] - v[:start_at] }.sum * plans_count
        builder.build

        expect(ContractPlan.count).to eql(plans_count)
        expect(TimeSlot.count).to eql(time_slots_count)
      end
    end
  end
end
