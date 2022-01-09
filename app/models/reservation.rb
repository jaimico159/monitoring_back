class Reservation < ApplicationRecord
  belongs_to :engineer
  belongs_to :time_slot
end
