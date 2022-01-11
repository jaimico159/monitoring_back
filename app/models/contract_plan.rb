class ContractPlan < ApplicationRecord
  belongs_to :contract
  has_many :time_slots
  has_many :reservations, through: :time_slots

  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :slot_duration
end
