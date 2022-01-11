class TimeSlot < ApplicationRecord
  belongs_to :contract
  belongs_to :contract_plan
  belongs_to :engineer, optional: true
end
