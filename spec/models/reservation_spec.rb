require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should belong_to(:engineer) }
  it { should belong_to(:time_slot) }
end
