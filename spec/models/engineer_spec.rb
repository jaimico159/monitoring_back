require 'rails_helper'

RSpec.describe Engineer, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:display_name) }
end
