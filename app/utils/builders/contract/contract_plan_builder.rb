module Builders
  module Contract
    class ContractPlanBuilder
      def initialize(contract:, from:, to:, options:)
        @contract = contract
        @from = from
        @to = to
        @options = options
      end

      def build
        week = @from
        while week < @to
          build_contract_plan(contract: @contract, start_date: week.beginning_of_week, end_date: week.end_of_week)

          week += 1.week
        end
      end

      private

      def build_contract_plan(contract:, start_date:, end_date:)
        contract_plan = ContractPlan.create(contract_id: contract.id, slot_duration: contract.slot_duration, start_date: start_date,
                                            end_date: end_date)

        while start_date <= end_date
          day_option = @options[start_date.wday]
          if day_option.blank?
            start_date += 1.day
            next
          end

          build_contract_plan_day(contract_plan: contract_plan, date: start_date, day_option: day_option)
          start_date += 1.day
        end
      end

      def build_contract_plan_day(contract_plan:, date:, day_option:)
        contract_plan_day = ContractPlanDay.create(current_date: date, contract_plan_id: contract_plan.id)
        build_slots(contract_plan_day: contract_plan_day, date: date, duration: contract_plan.slot_duration,
                    start_at: day_option[:start_at],
                    end_at: day_option[:end_at])
      end

      def build_slots(contract_plan_day:, date:, duration:, start_at:, end_at:)
        position_start = date.to_time.change({ hour: start_at })
        position_end = date.to_time.change({ hour: end_at })
        while position_start < position_end
          TimeSlot.create!(start_at: position_start, duration: duration, contract_id: @contract.id,
                           contract_plan_id: contract_plan_day.contract_plan_id, contract_plan_day_id: contract_plan_day.id)
          position_start += duration
        end
      end
    end
  end
end
