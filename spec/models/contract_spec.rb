require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { should have_many(:contract_plans) }
  it { should belong_to(:company) }
end
