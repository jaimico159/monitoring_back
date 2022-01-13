require 'rails_helper'

RSpec.describe Scheduler::V1::ContractPlans do
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

  describe 'GET /api/v1/contract_plans/:id/time_slots' do
    it 'return a contract plan and their time slots separated by day' do
      contract = create(:contract)
      start_date = Date.today.beginning_of_week
      end_date = (start_date + 2.weeks).end_of_week
      builder = Builders::Contract::ContractPlanBuilder
                .new(contract: contract, from: start_date,
                     to: end_date, options: options)

      builder.build
      contract_plan = ContractPlan.first

      get "/api/v1/contract_plans/#{contract_plan.id}/time_slots"

      expect(json_body['contract_plan_days']).to be_a(Array)
      expect(json_body['contract_plan_days'].length).to eq(contract_plan.contract_plan_days.length)
    end
  end

  describe 'POST /api/v1/contract_plans/:id/set_reservations' do
    it 'returns a json with the updated contract plan' do
      contract = create(:contract)
      start_date = Date.today.beginning_of_week
      end_date = (start_date + 2.weeks).end_of_week
      builder = Builders::Contract::ContractPlanBuilder
                .new(contract: contract, from: start_date,
                     to: end_date, options: options)

      builder.build
      contract_plan = ContractPlan.first

      post "/api/v1/contract_plans/#{contract_plan.id}/set_reservations", params: {
        reservations: []
      }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(json_body['contract_plan_days']).to be_a(Array)
    end
  end
end
