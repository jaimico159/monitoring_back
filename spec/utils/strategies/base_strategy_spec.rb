require 'rails_helper'

RSpec.describe Strategies::BaseStrategy do
  describe '#run' do
    it 'raises an error on calling run' do
      base = Strategies::BaseStrategy.new(contract_plan_id: 1)
      expect { base.run }.to raise_error(NoMethodError)
    end
  end
end
