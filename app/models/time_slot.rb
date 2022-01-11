class TimeSlot < ApplicationRecord
  belongs_to :contract
  belongs_to :contract_plan
  belongs_to :engineer, optional: true

  validates_presence_of :duration
  validates_presence_of :start_at
end
