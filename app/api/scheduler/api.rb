module Scheduler
  class API < Grape::API
    mount Scheduler::V1::Engineers
    mount Scheduler::V1::Companies
    mount Scheduler::V1::ContractPlans
  end
end
