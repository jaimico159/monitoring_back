module Strategies
  module ContractPlan
    class RandomAssignEngineers
      def initialize(contract_plan_id:)
        @contract_plan = ::ContractPlan.includes(time_slots: :reservations).find contract_plan_id
        @time_slots = @contract_plan.time_slots
      end

      def run
        slots = []
        @time_slots.each do |time_slot|
          ids = time_slot.reservations.pluck(:engineer_id)
          next if ids.blank?

          time_slot.engineer_id = ids.sample
          slots << time_slot
        end
        TimeSlot.import! slots, on_duplicate_key_update: [:engineer_id]
      end
    end
  end
end
