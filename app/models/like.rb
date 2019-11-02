class Like < ApplicationRecord
	belongs_to :gossip, optional: true
	belongs_to :comment, optional: true
	belongs_to :user
	validate :unique_like

			def unique_like
		if User.find(user_id).has(gossip_id)&&User.find(user_id).hasc(comment_id)
			errors.add(:gossip_id,:comment_id, message: "déjà fait") 
		end

	end


end