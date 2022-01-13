module Scheduler
  module V1
    class Companies < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resources :companies do
        desc 'Return the list of companies'
        get '/' do
          Company.all
        end

        desc 'Return a company contracts'
        get '/:id/contracts' do
          company = Company.find(params[:id])
          company.as_json(include: :contracts)
        end

        desc 'Return a contract engineers'
        get '/:id/contracts/:contract_id/engineers' do
          contract = Contract.includes(:engineers, :company).where(id: params[:contract_id],
                                                                   company_id: params[:id]).first

          contract.as_json(include: :engineers)
        end

        desc 'Return a contract time slots'
        get '/:id/contracts/:contract_id/time_slots' do
          contract = Contract.includes(:time_slots, :company).where(id: params[:contract_id],
                                                                    company_id: params[:id]).first
          contract.as_json(include: :time_slots)
        end
      end
    end
  end
end
