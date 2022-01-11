require 'rails_helper'

RSpec.describe ContractEngineer, type: :model do
  it { should belong_to(:contract) }
  it { should belong_to(:engineer) }
end
