class Tag < ApplicationRecord
  has_many :gossip_tags
  has_many :gossips, through: :gossip_tags
  validates :title, length: { minimum: 2 }
end
