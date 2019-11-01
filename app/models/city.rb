class City < ApplicationRecord
  has_many :users
  validates :name, length: { minimum: 2 }
  validates :name, length: { minimum: 5 }
end
