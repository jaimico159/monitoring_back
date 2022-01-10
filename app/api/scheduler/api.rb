module Scheduler
  class API < Grape::API
    mount Scheduler::V1::Engineers
  end
end
