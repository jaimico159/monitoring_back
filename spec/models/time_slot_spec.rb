require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  it { should belong_to(:contract_plan) }
  it { should belong_to(:contract) }
  it { should belong_to(:engineer) }
end
