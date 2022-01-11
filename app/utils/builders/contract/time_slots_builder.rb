module Builders
  module Contract
    class TimeSlotsBuilder
      def initialize(contract:, from:, to:, options:)
        @contract = contract
        @from = from
        @to = to
        @options = options
      end

      def build
        day = @from
        while day <= @to
          day_option = @options[day.wday]

          if day_option.blank?
            day += 1.day
            next
          end

          build_slots(date: day, duration: @contract.slot_duration, start_at: day_option[:start_at],
                      end_at: day_option[:end_at])

          day += 1.day
        end
      end

      private

      def build_slots(date:, duration:, start_at:, end_at:)
        position_start = date.to_time.change({ hour: start_at })
        position_end = date.to_time.change({ hour: end_at })
        while position_start <= position_end
          TimeSlot.create!(start_at: position_start, duration: duration, contract_id: @contract.id)
          position_start += duration
        end
      end
    end
  end
end
