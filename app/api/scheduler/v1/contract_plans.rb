module Scheduler
  module V1
    class ContractPlans < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resources :contract_plans do
        desc 'Get time slots of contract plan separated by contract plan day'
        get '/:id/time_slots' do
          contract_plan = ContractPlan.includes(contract_plan_days: { time_slots: %i[engineer
                                                                                     reservations] }).find(params[:id])
          contract_plan.as_json(include: { contract_plan_days: { include: { time_slots: { include: %i[engineer
                                                                                                      reservations] } } } })
        end

        desc 'Associate time slots to engineers for planning schedule'
        params do
          requires :reservations, type: Array
        end
        post '/:id/set_reservations' do
          puts params
          contract_plan = ContractPlan.includes(:time_slots, :reservations).find(params[:id])
          contract_plan.reservations.each(&:destroy) if contract_plan.reservations.length.positive?

          availabilities = []
          time_slots_ids = contract_plan.time_slots.ids
          params[:reservations].reject! { |av| time_slots_ids.exclude?(av[:time_slot_id]) }
          params[:reservations].each do |av|
            availabilities << Reservation.new(engineer_id: av[:engineer_id], time_slot_id: av[:time_slot_id])
          end
          Reservation.import! availabilities

          strategy = Strategies::ContractPlan::RandomAssignEngineers.new(contract_plan_id: contract_plan.id)
          strategy.run

          contract_plan.reload
          contract_plan.as_json(include: { contract_plan_days: { include: { time_slots: { include: %i[engineer
                                                                                                      reservations] } } } })
        end
      end
    end
  end
end
