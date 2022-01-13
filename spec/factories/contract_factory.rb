FactoryBot.define do
  factory :contract do
    name { Faker::Company.catch_phrase }
    company { association :company }
    start_at { Time.now.beginning_of_month }
    end_at { Time.now.end_of_month }
    slot_duration { 3600 }
  end
end
