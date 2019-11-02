class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "RecipientList"
  validates :email,
  uniqueness: true,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }

  validates :password, presence: true, length: { minimum: 6 }

    def has(gsp_id)
    
    self.likes.map{|like| like.gossip_id}.include?(gsp_id)
    
  end

      def hasc(cm_id)
    
    self.likes.map{|like| like.comment_id}.include?(cm_id)
    
  end

end
