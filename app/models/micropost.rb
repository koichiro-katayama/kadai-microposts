class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  
  validates :content, presence: true, length: { maximum: 255 }
  
  #def like(user)
    #favorites.create(user_id: user.id)
  #end
  
  #def deslike(user)
    #favorites.find_by(user_id: user.id).destroy
  #end
  
end
