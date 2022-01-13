module Strategies
  class BaseStrategy
    def initialize(contract_plan_id:); end

    def run
      raise NoMethodError, 'Implement your strategy'
    end
  end
end
