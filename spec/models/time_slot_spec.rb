require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  it { should belong_to(:contract_plan) }
  it { should belong_to(:contract) }
  it { should belong_to(:engineer).optional }
  it { should have_many(:reservations) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:start_at) }
end
