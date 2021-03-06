class Memo < ApplicationRecord
  attr_accessor :favorite_count, :is_like

  belongs_to :user
  has_many :favorites
  
  validates :user_id, presence: true
  validates :content, presence: true
end
