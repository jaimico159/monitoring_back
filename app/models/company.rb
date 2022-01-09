class Company < ApplicationRecord
  has_many :contracts

  validates_presence_of :name
  validates_uniqueness_of :name
end
