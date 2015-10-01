class Micropost < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence:true
  validates :content, presence:true, length: { in: 1..140 }
  
  default_scope -> { order(created_at: :desc) }
  
  has_many :micropost_favorites,  class_name:   "Favorite",
                                  foreign_key:  "micropost_id",
                                  dependent: :destroy
  has_many :favoriting_users, through: :micropost_favorites, source: :user
end
