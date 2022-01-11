require 'rails_helper'

RSpec.describe ContractPlan, type: :model do
  it { should belong_to(:contract) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:slot_duration) }
end
