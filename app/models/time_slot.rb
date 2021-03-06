class TimeSlot < ApplicationRecord
  belongs_to :contract
  belongs_to :contract_plan
  belongs_to :contract_plan_day
  belongs_to :engineer, optional: true
  has_many :reservations

  validates_presence_of :duration
  validates_presence_of :start_at

  default_scope -> { order('start_at asc') }
end
