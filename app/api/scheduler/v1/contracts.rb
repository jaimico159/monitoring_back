module Scheduler
  module V1
    class Contracts < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resources :contracts do
        desc 'Return the list of contract plans for this contract'
        get '/:id/contract_plans' do
          contract = Contract.includes(:contract_plans).find(params[:id])
          contract.as_json(include: :contract_plans)
        end

        desc 'Return the list of contract engineers'
        get '/:id/engineers' do
          contract = Contract.includes(:engineers).find(params[:id])
          contract.as_json(include: :engineers)
        end
      end
    end
  end
end
