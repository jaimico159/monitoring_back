class Contract < ApplicationRecord
  belongs_to :company
  has_many :contract_engineers
  has_many :engineers, through: :contract_engineers
  has_many :time_slots
  has_many :reservations, through: :time_slots
  has_many :contract_plans
end
