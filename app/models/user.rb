class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  
  has_many :multi_pms
  has_many :private_messages, through: :multi_pms
  def name
    "#{self.first_name} #{last_name}"
  end
end
