module Scheduler
  module V1
    class Engineers < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resources :engineers do
        desc 'Return the list of engineers'
        get '/' do
          Engineer.all
        end
      end
    end
  end
end
