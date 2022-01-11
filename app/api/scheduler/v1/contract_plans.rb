module Scheduler
  module V1
    class ContractPlans < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resources :contract_plans do
        desc 'Associate time slots to engineers for planning schedule'
        params do
          requires :availabilities, type: Array
        end
        post '/:id/set_availabilities' do
          contract_plan = ContractPlan.includes(:time_slots, :reservations).find(params[:id])
          contract_plan.reservations.destroy_all if contract_plan.reservations.positive?

          availabilities = []
          time_slots_ids = contract_plan.time_slots.ids
          params[:availabilities].reject! { |av| time_slots_ids.exclude?(av[:time_slot_id]) }
          params[:availabilities].each do |av|
            availabilities << Reservation.new(engineer_id: av[:engineer_id], time_slot_id: av[:time_slot_id])
          end
          Reservation.import! availabilities
          {
            status: 200,
            message: 'Success'
          }
        end
      end
    end
  end
end
