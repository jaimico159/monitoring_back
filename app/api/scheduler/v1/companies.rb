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
      end
    end
  end
end
