require 'rails_helper'

RSpec.describe ContractPlanDay, type: :model do
  it { should belong_to(:contract_plan) }
  it { should have_many(:time_slots) }
  it { should validate_presence_of(:current_date) }
end
