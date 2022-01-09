class Engineer < ApplicationRecord
  has_many :contracts, through: :contract_engineers
  has_many :reservations
end
