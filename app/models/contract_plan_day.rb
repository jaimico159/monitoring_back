class ContractPlanDay < ApplicationRecord
  belongs_to :contract_plan
  has_many :time_slots
  validates_presence_of :current_date
end
