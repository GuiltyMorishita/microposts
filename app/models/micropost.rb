class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :user_id, presence:true
  validates :content, presence:true, length: { in: 1..140 }
  
  default_scope -> { order(created_at: :desc) }
end
