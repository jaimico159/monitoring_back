class Engineer < ApplicationRecord
  has_many :contracts, through: :contract_engineers
  has_many :reservations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :display_name
end
