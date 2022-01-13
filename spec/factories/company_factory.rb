FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
  end
end

def company_with_contracts(contracts_count: 5)
  FactoryBot.create(:company) do |company|
    FactoryBot.create_list(:contract, contracts_count, company: company)
  end
end
