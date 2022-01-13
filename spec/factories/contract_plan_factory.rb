FactoryBot.define do
  factory :contract_plan do
    contract { association :contract }
    start_date { Date.today.beginning_of_week }
    end_date { Date.today.end_of_week }
    slot_duration { contract.slot_duration }
  end
end
