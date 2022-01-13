require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { should have_many(:contract_plans) }
  it { should belong_to(:company) }
  it { should validate_presence_of(:slot_duration) }
  it { should validate_presence_of(:start_at) }
  it { should validate_presence_of(:end_at) }
end
