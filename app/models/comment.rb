class Comment < ApplicationRecord
  belongs_to :gossip, optional: true
  belongs_to :user
    validates :user_id, presence: true	
  validates :gossip_id, presence: true
end
